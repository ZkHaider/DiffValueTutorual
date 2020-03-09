//
//  Effect.swift
//  DiffValueExample
//
//  Created by Haider Khan on 3/8/20.
//  Copyright © 2020 zkhaider. All rights reserved.
//

import Foundation

public protocol AnyEffect {
    var anyRun: (@escaping (Any) -> Void) -> Void { get }
}

public struct Effect<A>: AnyEffect {
    public let run: (@escaping (A) -> Void) -> Void
}

extension Effect {
    
    public var anyRun: (@escaping (Any) -> Void) -> Void {
        return run
    }
    
}
