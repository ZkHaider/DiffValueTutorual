//
//  Root.TabBar.Controller.swift
//  DiffValueExample
//
//  Created by Haider Khan on 3/8/20.
//  Copyright © 2020 zkhaider. All rights reserved.
//

import UIKit

final class RootTabBarController: UITabBarController {
    
    // MARK: - Init
    
    init() {
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
        self.viewControllers = TabItems.allCases.compactMap { $0.viewController }
        self.view.backgroundColor = .white
    }
    
}

extension RootTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController,
                          didSelect viewController: UIViewController) {
        
    }
    
}
