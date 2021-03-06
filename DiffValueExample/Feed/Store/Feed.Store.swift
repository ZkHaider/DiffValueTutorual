//
//  Feed.Store.swift
//  DiffValueExample
//
//  Created by Haider Khan on 3/8/20.
//  Copyright © 2020 zkhaider. All rights reserved.
//

import DiffValue

final class FeedStore: SubStore<FeedState, FeedActions> {
    
    // MARK: - Reducer
    
    override var reducer: Reducer<FeedState, FeedActions> {
        return feedReducer
    }
    
    // MARK: - Init
    
    init() {
        super.init(subStores: [])
    }
    
}
