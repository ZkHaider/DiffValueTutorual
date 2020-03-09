//
//  Feed.State.swift
//  DiffValueExample
//
//  Created by Haider Khan on 3/8/20.
//  Copyright © 2020 zkhaider. All rights reserved.
//

import DiffValue

public struct Story: Equatable {
    
}

public struct FeedState: Equatable {
    var stories: [Story]
}

extension FeedState: HasIdentity {
    public static var identity: FeedState {
        return FeedState(stories: [])
    }
}
