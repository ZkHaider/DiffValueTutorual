//
//  Feed.View.swift
//  DiffValueExample
//
//  Created by Haider Khan on 3/8/20.
//  Copyright © 2020 zkhaider. All rights reserved.
//

import UIKit

final class FeedView: UIView {
    
    // MARK: - Views
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        return view
    }()
    
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
        self.collectionView.frame = self.bounds 
    }
    
}

extension FeedView {
    fileprivate func initialize() {
        func addSubviews() {
            self.addSubview(self.collectionView)
        }
        func prepareViews() {
            self.collectionView.alwaysBounceVertical = true 
            self.collectionView.register(FeedCell.self, forCellWithReuseIdentifier: "FeedCell")
        }
        addSubviews()
        prepareViews()
    }
}
