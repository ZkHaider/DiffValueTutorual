//
//  Feed.Actions.swift
//  DiffValueExample
//
//  Created by Haider Khan on 3/8/20.
//  Copyright © 2020 zkhaider. All rights reserved.
//

import Foundation

public enum FeedActions: Action {
    case fetchTopStories
    case didFetchTopStories([Story])
}
