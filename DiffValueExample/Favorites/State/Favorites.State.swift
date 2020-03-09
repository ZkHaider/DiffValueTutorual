//
//  Favorites.State.swift
//  DiffValueExample
//
//  Created by Haider Khan on 3/8/20.
//  Copyright © 2020 zkhaider. All rights reserved.
//

import DiffValue

public struct FavoritesState {
    var stories: [Story]
}

extension FavoritesState: Equatable {}

extension FavoritesState: HasIdentity {
    public static var identity: FavoritesState {
        return FavoritesState(stories: [])
    }
}
