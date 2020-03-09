//
//  Action.swift
//  DiffValueExample
//
//  Created by Haider Khan on 3/8/20.
//  Copyright © 2020 zkhaider. All rights reserved.
//

import Foundation

public protocol Action {
    var name: String { get }
    static var name: String { get }
}

extension Action {
    
    public var name: String {
        return String(
            String(reflecting: self)[...]
                .prefix(while: { $0 != "(" })
        )
    }
    
    public static var name: String {
        return String(
            String(reflecting: self)[...]
                .prefix(while: { $0 != "(" })
        )
    }
    
}

public protocol CodableAction: Action, Codable {}
