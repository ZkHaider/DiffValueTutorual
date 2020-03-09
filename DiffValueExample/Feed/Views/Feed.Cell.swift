//
//  Feed.Cell.swift
//  DiffValueExample
//
//  Created by Haider Khan on 3/8/20.
//  Copyright © 2020 zkhaider. All rights reserved.
//

import UIKit

final class FeedCell: UICollectionViewCell {
    
    // MARK: - Views
    
    let storyImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .black
        return view
    }()
    
    let textContainer: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    
    let storyTopLabel: FeedVerticalAlignedLabel = {
        let view = FeedVerticalAlignedLabel(frame: .zero)
        view.textColor = UIColor.black.withAlphaComponent(0.8)
        view.font = UIFont.systemFont(ofSize: 14.0)
        view.textAlignment = .left
        view.text = "Top Label"
        view.contentMode = .bottom
        return view
    }()
    
    let storyTitleLabel: FeedVerticalAlignedLabel = {
        let view = FeedVerticalAlignedLabel(frame: .zero)
        view.numberOfLines = 2
        view.textColor = .black
        view.textAlignment = .left
        view.font = UIFont.boldSystemFont(ofSize: 22.0)
        view.text = "Title"
        view.contentMode = .top
        return view
    }()
    
    let storyBottomLabel: FeedVerticalAlignedLabel = {
        let view = FeedVerticalAlignedLabel(frame: .zero)
        view.textColor = UIColor.black.withAlphaComponent(0.8)
        view.font = UIFont.systemFont(ofSize: 14.0)
        view.textAlignment = .left
        view.text = "Bottom Label"
        view.contentMode = .top
        return view
    }()
    
    let commentContainer: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        return view
    }()
    
    let commentImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "comment_bubble")
        view.alpha = 0.70
        return view
    }()
    
    let commentLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.numberOfLines = 1
        view.textColor = .black
        view.textAlignment = .center
        view.font = UIFont.boldSystemFont(ofSize: 14.0)
        view.text = "1"
        return view
    }()
    
    let topDivider: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.black.withAlphaComponent(0.15)
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
        
        let bounds = self.bounds
        
        
        // Slice 18% from left to get image view rect
        var (slice, remainder) = bounds.divided(
            atDistance: bounds.width * 0.22,
            from: .minXEdge
        )
        
        // Image
        
        self.storyImageView.frame = slice.insetBy(dx: 10.0, dy: 16.0)
        self.storyImageView.center = CGPoint(
            x: self.storyImageView.center.x,
            y: slice.height / 2.0
        )
        
        // Text
        
        (slice, remainder) = remainder.divided(
            atDistance: remainder.width * 0.70,
            from: .minXEdge
        )
        
        self.textContainer.frame = slice
        
        var (textSlice, textRemainder) = self.textContainer
            .bounds
            .insetBy(dx: 0.0, dy: 0.0)
            .divided(
                atDistance: slice.height * 0.3,
                from: .minYEdge
            )
        self.storyTopLabel.frame = textSlice
        
        (textSlice, textRemainder) = textRemainder
            .divided(
                atDistance: textRemainder.height * 0.7,
                from: .minYEdge
            )
        self.storyTitleLabel.frame = textSlice
        self.storyBottomLabel.frame = textRemainder
        
        // Comment
        
        self.commentContainer.frame = remainder
        
        self.commentImageView.frame = self.commentContainer
            .bounds
            .insetBy(dx: 24.0, dy: 28.0)
        
        self.commentLabel.frame = self.commentImageView
            .frame
            .insetBy(dx: 2.0, dy: 0.0)
            .offsetBy(dx: 0.0, dy: -2.0)
        
        // Divider
        
        self.topDivider.frame = CGRect(
            x: 0.0,
            y: 0.0,
            width: bounds.width,
            height: 2.0
        )
    }
    
}

extension FeedCell {
    fileprivate func initialize() {
        func addSubviews() {
            [
                storyTopLabel,
                storyTitleLabel,
                storyBottomLabel
            ].forEach(textContainer.addSubview)
            [
                commentImageView,
                commentLabel
            ].forEach(commentContainer.addSubview)
            [
                storyImageView,
                textContainer,
                commentContainer,
                topDivider
            ].forEach(self.contentView.addSubview)
        }
        func prepareViews() {
            
        }
        addSubviews()
        prepareViews()
    }
}
