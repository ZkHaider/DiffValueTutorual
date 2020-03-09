//
//  Root.Store.swift
//  DiffValueExample
//
//  Created by Haider Khan on 3/8/20.
//  Copyright © 2020 zkhaider. All rights reserved.
//

import DiffValue
import Combine

final class RootStore: SubStore<RootState, RootActions> {
    
    // MARK: - SubStores
    
    let feedStore: FeedStore = FeedStore()
    let favoritesStore: FavoritesStore = FavoritesStore()
    
    // MARK: - Reducer
    
    override var reducer: Reducer<RootState, RootActions> {
        return rootReducer
    }
    
    // MARK: - Init
    
    init() {
        super.init(subStores: [
            feedStore,
            favoritesStore
        ])
    }
    
}
