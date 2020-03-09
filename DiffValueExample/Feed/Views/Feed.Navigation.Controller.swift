//
//  Feed.Navigation.Controller.swift
//  DiffValueExample
//
//  Created by Haider Khan on 3/8/20.
//  Copyright © 2020 zkhaider. All rights reserved.
//

import UIKit

final class FeedNavigationController: UINavigationController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        initialize()
    }
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        initialize()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension FeedNavigationController {
    fileprivate func initialize() {
        self.navigationBar.prefersLargeTitles = true
        self.navigationBar.topItem?.title = "Top Stories"
    }
}
