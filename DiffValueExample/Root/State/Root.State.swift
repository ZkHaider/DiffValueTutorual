//
//  Root.State.swift
//  DiffValueExample
//
//  Created by Haider Khan on 3/8/20.
//  Copyright © 2020 zkhaider. All rights reserved.
//

import DiffValue

public struct RootState {
    var someProperty: String
}

extension RootState: Equatable {}

extension RootState: Codable {}

extension RootState: HasIdentity {
    public static var identity: RootState {
        return RootState(someProperty: "")
    }
}
