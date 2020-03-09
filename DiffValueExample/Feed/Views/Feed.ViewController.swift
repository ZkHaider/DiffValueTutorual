//
//  Feed.ViewController.swift
//  DiffValueExample
//
//  Created by Haider Khan on 3/8/20.
//  Copyright © 2020 zkhaider. All rights reserved.
//

import UIKit 

final class FeedViewController: UIViewController {
    
    // MARK: - Store
    
    let store: FeedStore
    
    // MARK: - Views
    
    var _view: FeedView {
        return self.view as! FeedView
    }
    
    // MARK: - Init
    
    init(store: FeedStore) {
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
        self.view = FeedView(frame: .zero)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension FeedViewController {
    fileprivate func initialize() {
        self._view.collectionView.delegate = self
        self._view.collectionView.dataSource = self
    }
}

extension FeedViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(
            width: UIScreen.main.bounds.width,
            height: 100.0
        )
    }
    
}

extension FeedViewController: UICollectionViewDelegate {
    
}

extension FeedViewController: UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int
    {
        return 10
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        guard
            let feedCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "FeedCell",
                for: indexPath
            ) as? FeedCell
            else {
                return UICollectionViewCell()
        }
        return feedCell
    }
    
}
