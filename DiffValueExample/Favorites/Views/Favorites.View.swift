//
//  Favorites.View.swift
//  DiffValueExample
//
//  Created by Haider Khan on 3/8/20.
//  Copyright © 2020 zkhaider. All rights reserved.
//

import UIKit

final class FavoritesView: UIView {
    
    // MARK: - Views
    
    // Add views here...
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}

extension FavoritesView {
    fileprivate func initialize() {
        func addSubviews() {
            
        }
        func prepareViews() {
            
        }
        addSubviews()
        prepareViews()
    }
}
