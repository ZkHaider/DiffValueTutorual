//
//  Store.swift
//  DiffValueExample
//
//  Created by Haider Khan on 3/8/20.
//  Copyright © 2020 zkhaider. All rights reserved.
//

import DiffValue
import Combine

public protocol AnyStore: class {
    var nextStore: AnyStore? { get set }
    var subStores: [AnyStore] { get }
    func send(_ anyAction: Action)
}

extension AnyStore {
    public var subStores: [AnyStore] {
        return []
    }
}

public protocol Store: AnyStore {
    associatedtype State: Equatable & HasIdentity
    associatedtype Actions: Action
    var state: State { get }
    var cancellables: [AnyCancellable] { get set }
    var reducer: Reducer<State, Actions> { get }
    func send(_ action: Actions)
}

private var mapKey: UInt8 = 8

extension Store {
    
    internal var subscriptionMap: SubscriptionMap {
        get {
            guard
                let map = objc_getAssociatedObject(self, &mapKey) as? SubscriptionMap
                else {
                    let map = SubscriptionMap()
                    objc_setAssociatedObject(
                        self,
                        &mapKey,
                        map,
                        .OBJC_ASSOCIATION_RETAIN_NONATOMIC
                    )
                    return map
            }
            return map
        }
    }
    
    public func send(_ anyAction: Action) {
        guard
            let action = anyAction as? Actions
            else { return }
        send(action)
    }
    
    public func add<L, A: Action>(
        for actionType: A.Type,
        target: L,
        hook: Hook<L, A>)
    {
        let listener = ActionListener(listener: target, for: actionType, hook: hook)
        
    }
    
    public func runEffects(_ effects: [AnyEffect]) {
        effects.forEach { effect in
            effect.anyRun { [weak self] value in
                guard
                    let this = self,
                    let action = value as? Action
                    else { return }
                this.subStores.forEach { $0.send(action) }
            }
        }
    }
    
}

open class SubStore<S: Equatable & HasIdentity, A: Action>: Store {
            
    // MARK: - Definitions
    
    public typealias State = S
    public typealias Actions = A
    
    // MARK: - Parent Store
    
    open weak var nextStore: AnyStore? = nil
    
    private var _subStores: [AnyStore] = []
    public var subStores: [AnyStore] {
        return _subStores
    }
    
    // MARK: - Reducer
    
    open var reducer: Reducer<State, Actions> {
        return Reducer { state, action in [] }
    }
    
    // MARK: - State
    
    @Diff(defaultValue: S.identity)
    open var state: S
    
    // MARK: - Cancellables
    
    open var cancellables: [AnyCancellable] = []
    
    // MARK: - Init
    
    init(subStores: [AnyStore] = []) {
        self._subStores = subStores
        subStores.forEach { $0.nextStore = self }
    }
    
    // MARK: - Dispatch
    
    public func send(_ action: A) {
        let effects = self.reducer.reduce(&self.$state.wrappedValue, action)
        runEffects(effects)
    }
    
    // MARK: - Observation
    
    public func subscribe(_ f: @escaping (State) -> Void) {
        self.$state.relay.sink(receiveValue: f).store(in: &self.cancellables)
    }
    
    public func observe<Target, Property>(
        on keyPath: KeyPath<State, Property>,
        target: Target,
        hook: Hook<Target, Property>)
    {
        self.$state.observe(keyPath, target: target, hook: hook)
    }
    
}
