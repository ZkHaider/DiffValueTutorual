//
//  Feed.Store.swift
//  DiffValueExample
//
//  Created by Haider Khan on 3/8/20.
//  Copyright © 2020 zkhaider. All rights reserved.
//

import DiffValue
import Combine

final class FeedStore: Store {
    
    // MARK: - Definitions
    
    typealias State = FeedState
    typealias Actions = FeedActions
    
    // MARK: - State
    
    @Diff(defaultValue: .identity)
    var feedState: FeedState
    
    // MARK: - Reducer
    
    var reducer: Reducer<FeedState, FeedActions> {
        return feedReducer
    }
    
    // MARK: - Cancellables
    
    var cancellables: [AnyCancellable] = []
    
    // MARK: - Dispatch
    
    func dispatch(_ action: Actions) {
        let effects = self.reducer.reduce(&self.feedState, action)
    }
    
    // MARK: - Observation
    
    func subscribe(_ f: @escaping (State) -> Void) {
        self._feedState.relay.sink(receiveValue: f).store(in: &cancellables)
    }
    
    func observe<Target, Property>(
        on keyPath: KeyPath<State, Property>,
        target: Target,
        hook: Hook<Target, Property>) {
        self._feedState.observe(
            keyPath,
            target: target,
            hook: hook
        )
    }
    
}
