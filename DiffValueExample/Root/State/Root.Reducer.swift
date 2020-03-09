//
//  Root.Reducer.swift
//  DiffValueExample
//
//  Created by Haider Khan on 3/8/20.
//  Copyright © 2020 zkhaider. All rights reserved.
//

import Foundation

let rootReducer = Reducer<RootState, RootActions> { (state, action) in
    switch action {
    case .appLoaded:
        return []
    }
}
