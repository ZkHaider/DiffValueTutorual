//
//  Store.swift
//  DiffValueExample
//
//  Created by Haider Khan on 3/8/20.
//  Copyright © 2020 zkhaider. All rights reserved.
//

import Foundation

public protocol Store: class {
    associatedtype State: Equatable
    associatedtype Actions: Action
    var reducer: Reducer<State, Actions> { get }
    func dispatch(_ action: Actions)
}
