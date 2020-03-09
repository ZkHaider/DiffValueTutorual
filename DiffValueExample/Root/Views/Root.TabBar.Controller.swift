//
//  Root.TabBar.Controller.swift
//  DiffValueExample
//
//  Created by Haider Khan on 3/8/20.
//  Copyright © 2020 zkhaider. All rights reserved.
//

import UIKit

final class RootTabBarController: UITabBarController {
    
    // MARK: - Store
    
    let store: RootStore
    
    // MARK: - ViewController
    
    lazy var feedNavigationController: FeedNavigationController = {
        let feedViewController = FeedViewController(store: self.store.feedStore)
        feedViewController.tabBarItem = TabItems.stories.tabItem
        let feedNavigationController = FeedNavigationController(rootViewController: feedViewController)
        feedNavigationController.title = "Top Stories"
        return feedNavigationController
    }()
    
    lazy var favoritesNavigationController: FavoritesNavigationController = {
        let favoritesViewController = FavoritesViewController(store: self.store.favoritesStore)
        favoritesViewController.tabBarItem = TabItems.favorites.tabItem
        let favoritesNavigationController = FavoritesNavigationController(rootViewController: favoritesViewController)
        favoritesNavigationController.title = "Favorites"
        return favoritesNavigationController
    }()
    
    // MARK: - Init
    
    init(store: RootStore) {
        self.store = store
        super.init(nibName: nil, bundle: nil)
        initialize()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension RootTabBarController {
    
    fileprivate func initialize() {
        self.viewControllers = [
            self.feedNavigationController,
            self.favoritesNavigationController
        ]
        self.view.backgroundColor = .white
    }
    
}

extension RootTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController,
                          didSelect viewController: UIViewController) {
        
    }
    
}
