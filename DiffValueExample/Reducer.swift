//
//  Reducer.swift
//  DiffValueExample
//
//  Created by Haider Khan on 3/8/20.
//  Copyright © 2020 zkhaider. All rights reserved.
//

import Foundation

public struct Reducer<S: Equatable, A: Action> {
    public let reduce: (inout S, A) -> [AnyEffect]
}
