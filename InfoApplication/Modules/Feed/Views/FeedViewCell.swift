//
//  FeedViewCell.swift
//  InfoApplication
//
//  Created by Roman Korobskoy on 09.05.2022.
//

import UIKit

class FeedViewCell<T: UIView>: UICollectionViewCell {
    
    public let containerView: T
    
    override init(frame: CGRect) {
        self.containerView = T(frame: .zero)
        super .init(frame: frame)
        self.contentView.addSubview(self.containerView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.containerView.frame = self.contentView.frame
    }
}
