//
//  Favorites.Reducer.swift
//  DiffValueExample
//
//  Created by Haider Khan on 3/8/20.
//  Copyright © 2020 zkhaider. All rights reserved.
//

import Foundation

let favoritesReducer = Reducer<FavoritesState, FavoritesActions> { (state, action) in
    switch (action) {
    case .saveStory:
        return []
    }
}
