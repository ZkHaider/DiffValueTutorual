//
//  WeakKey.Dictionary.swift
//  DiffValueExample
//
//  Created by Haider Khan on 3/8/20.
//  Copyright © 2020 zkhaider. All rights reserved.
//

import Foundation
import ObjectiveC

public final class DeallocObserver {
    
    let dealloc: () -> Void
    
    init(dealloc: @escaping () -> Void) {
        self.dealloc = dealloc
    }
    
    deinit {
        dealloc()
    }
}

public final class WeakKeyDictionary<K: AnyObject, V> {
    
    // MARK: - Attributes
    
    private var dictionary = Dictionary<WeakHashbox, V>()
    
    public var count: Int {
        return dictionary.count
    }
    
    public var isEmpty: Bool {
        return dictionary.isEmpty
    }
    
    // MARK: - Init
    
    public init() {}
    
    // MARK: - Subscripts
    
    public subscript(key: K) -> V? {
        get { return value(for: key) }
        set { setValue(newValue, for: key) }
    }
    
    // MARK: - Get / Set
    
    public func value(for key: K) -> V? {
        return self.dictionary[WeakHashbox(key)]
    }
    
    public func setValue(
        _ newValue: V?,
        for key: K) {
        
        let hashBox = WeakHashbox(key)
        
        let watcher = DeallocObserver { [weak self] in
            guard let this = self else { return }
            this.dictionary[hashBox] = nil
        }
        
        guard
            let value = newValue
            else {
                objc_setAssociatedObject(
                    key,
                    Unmanaged.passUnretained(self).toOpaque(),
                    nil,
                    .OBJC_ASSOCIATION_RETAIN_NONATOMIC
                )
                self.dictionary[hashBox] = nil
                return
        }
        
        objc_setAssociatedObject(
            key,
            Unmanaged.passUnretained(self).toOpaque(),
            watcher,
            .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        )
        self.dictionary[hashBox] = value
    }
    
    @discardableResult
    public func removeValue(for key: K) -> V? {
        objc_setAssociatedObject(
            key,
            Unmanaged.passUnretained(self).toOpaque(),
            nil,
            .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        )
        return self.dictionary.removeValue(
            forKey: WeakHashbox(hashValue: ObjectIdentifier(key).hashValue)
        )
    }
    
}

extension WeakKeyDictionary: Sequence {
    
    public var keyValues: [(K, V)] {
        let pair: [(K, V)] = dictionary.compactMap { key, value in
            if let key = key.value as? K {
                return (key, value)
            } else {
                return nil
            }
            }
        return pair
    }
    
    public __consuming func makeIterator() -> AnyIterator<(K, V)> {
        let keyValues = self.keyValues
        var generator = keyValues.makeIterator()
        return AnyIterator {
            return generator.next()
        }
    }
    
}
