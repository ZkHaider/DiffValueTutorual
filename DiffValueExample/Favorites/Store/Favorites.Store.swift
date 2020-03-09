//
//  Favorites.Storw.swift
//  DiffValueExample
//
//  Created by Haider Khan on 3/8/20.
//  Copyright © 2020 zkhaider. All rights reserved.
//

import DiffValue
import Combine

final class FavoritesStore: SubStore<FavoritesState, FavoritesActions> {
    
    // MARK: - Reducer
    
    override var reducer: Reducer<FavoritesState, FavoritesActions> {
        return favoritesReducer
    }
    
    // MARK: - Init
    
    init() {
        super.init(subStores: [])
    }
    
}
