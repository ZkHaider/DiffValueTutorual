//
//  Listener.swift
//  DiffValueExample
//
//  Created by Haider Khan on 3/8/20.
//  Copyright © 2020 zkhaider. All rights reserved.
//

import DiffValue

public protocol AnyListener {
    var listener: AnyObject? { get }
    var actionType: Action.Type { get }
    func handleAction(action: Action)
}

final class ActionListener<L: AnyObject, A: Action>: AnyListener {
    
    // MARK: - Definitions
    
    typealias Listener = L
    typealias ActionKind = A
    
    // MARK: - Attributes
    
    private weak var _listener: Listener? = nil
    var listener: AnyObject? {
        return _listener
    }
    
    let actionType: Action.Type
    let hook: Hook<Listener, A>
    
    // MARK: - Init
    
    init(listener: Listener,
         for actionType: Action.Type,
         hook: Hook<L, A>) {
        self._listener = listener
        self.actionType = actionType
        self.hook = hook
    }
    
    // MARK: - Action Handle
    
    func handleAction(action: Action) {
        guard
            let listener = self.listener as? Listener,
            let typedAction = action as? ActionKind
            else { return }
        switch self.hook {
        case .method(let method):
            method(listener)(typedAction)
        case .closure(let closure):
            closure(typedAction)
        }
    }
    
}
