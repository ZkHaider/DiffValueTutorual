//
//  Feed.Reducer.swift
//  DiffValueExample
//
//  Created by Haider Khan on 3/8/20.
//  Copyright © 2020 zkhaider. All rights reserved.
//

import Foundation

let feedReducer = Reducer<FeedState, FeedActions>(reduce: { state, action in
    switch action {
    case .fetchTopStories:
        let effect: Effect<Result<[Int], NetworkError>> = HackerNewsAPI.fetch(on: .topStories)
        return [effect]
    case .didFetchTopStories(let stories):
        state.stories = stories
        return []
    }
})
