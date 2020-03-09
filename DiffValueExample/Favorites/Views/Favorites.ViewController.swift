//
//  Favorites.ViewController.swift
//  DiffValueExample
//
//  Created by Haider Khan on 3/8/20.
//  Copyright © 2020 zkhaider. All rights reserved.
//

import UIKit

final class FavoritesViewController: UIViewController {
    
    // MARK: - Store
    
    let store: FavoritesStore
    
    // MARK: - Views
    
    var _view: FavoritesView {
        return self.view as! FavoritesView
    }
    
    // MARK: - Init
    
    init(store: FavoritesStore) {
        self.store = store 
        super.init(nibName: nil, bundle: nil)
        initialize()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        self.view = FavoritesView(frame: .zero)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}


extension FavoritesViewController {
    fileprivate func initialize() {
        
    }
}
