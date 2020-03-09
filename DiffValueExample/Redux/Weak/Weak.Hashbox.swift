//
//  Weak.Hashbox.swift
//  DiffValueExample
//
//  Created by Haider Khan on 3/8/20.
//  Copyright © 2020 zkhaider. All rights reserved.
//

import Foundation

public struct WeakHashbox: Hashable {
    
    // MARK: - Attributes
    
    private weak var _value: AnyObject? = nil
    
    public var value: AnyObject? {
        return _value
    }
    
    // MARK: - Hash
    
    let hash: Int
    
    // MARK: - Init
    
    public init(_ value: AnyObject) {
        _value = value
        self.hash = ObjectIdentifier(value).hashValue
    }
    
    public init(hashValue: Int) {
        self._value = nil
        self.hash = hashValue
    }
    
    // MARK: - Hashable
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.hash)
    }
    
    public static func ==(lhs: WeakHashbox,
                          rhs: WeakHashbox) -> Bool {
        if lhs.hash != rhs.hash {
            return false
        }
        return true
    }
    
}
