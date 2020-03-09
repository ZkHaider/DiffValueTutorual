//
//  Root.Tabs.swift
//  DiffValueExample
//
//  Created by Haider Khan on 3/8/20.
//  Copyright © 2020 zkhaider. All rights reserved.
//

import UIKit

enum TabItems: Int, CaseIterable {
    case stories
    case favorites
    
    var systemItem: UITabBarItem.SystemItem {
        switch self {
        case .stories: return .featured
        case .favorites: return .favorites
        }
    }
    
    var tabItem: UITabBarItem {
        return UITabBarItem(tabBarSystemItem: self.systemItem, tag: self.rawValue)
    }
    
    var viewController: UIViewController {
        switch self {
        case .stories:
            let feedViewController = FeedViewController()
            feedViewController.tabBarItem = self.tabItem
            let feedNavigationController = FeedNavigationController(rootViewController: feedViewController)
            feedNavigationController.title = "Top Stories"
            return feedNavigationController
        case .favorites:
            let favoritesViewController = FavoritesViewController()
            favoritesViewController.tabBarItem = self.tabItem
            let favoritesNavigationController = FavoritesNavigationController(rootViewController: favoritesViewController)
            favoritesNavigationController.title = "Favorites"
            return favoritesNavigationController
        }
    }
}
