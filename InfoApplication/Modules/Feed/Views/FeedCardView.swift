//
//  FeedCardView.swift
//  InfoApplication
//
//  Created by Roman Korobskoy on 09.05.2022.
//

import UIKit

class FeedCardView: UIView {
    
    private let infoLabel = UILabel()
    private let titleLabel = UILabel()
    private let shortDescriptionLabel = UILabel()
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        self.addSubview(infoLabel)
        self.addSubview(shortDescriptionLabel)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        
        self.titleLabel.numberOfLines = 3
        self.shortDescriptionLabel.numberOfLines = 2
        
        self.titleLabel.backgroundColor = .systemGray
        self.titleLabel.clipsToBounds = true
        self.titleLabel.layer.cornerRadius = 10
        
        self.infoLabel.textColor = .white
        self.titleLabel.font = Font.system(ofSize: 32, weight: .bold)
        self.titleLabel.textColor = .white
        
        self.shortDescriptionLabel.font = Font.system(ofSize: 18, weight: .regular)
        self.shortDescriptionLabel.textColor = .systemGray
        
        self.imageView.contentMode = .scaleAspectFill
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let maxLabelWidth = self.frame.width - Constants.margin * 2
        let maxLabelSize = CGSize(width: maxLabelWidth, height: .greatestFiniteMagnitude)
        
        let infoLabelSize = self.infoLabel.sizeThatFits(maxLabelSize)
        self.infoLabel.frame.origin = CGPoint(x: Constants.margin, y: Constants.margin)
        self.infoLabel.frame.size = infoLabelSize
        
        let shortDescriptionLabelSize = self.shortDescriptionLabel.sizeThatFits(maxLabelSize)
        let shortDescriptionOrigin = CGPoint(x: Constants.margin,
                                             y: self.frame.height - Constants.margin - shortDescriptionLabelSize.height)
        self.shortDescriptionLabel.frame.origin = shortDescriptionOrigin
        self.shortDescriptionLabel.frame.size = shortDescriptionLabelSize
        
        let titleLabelSize = self.titleLabel.sizeThatFits(maxLabelSize)
        let titleLabelOrigin = CGPoint(x: Constants.margin,
                                       y: self.shortDescriptionLabel.frame.minY - Constants.margin - titleLabelSize.height)
        self.titleLabel.frame.origin = titleLabelOrigin
        self.titleLabel.frame.size = titleLabelSize
        self.imageView.frame = self.frame
    }
    
    func update(with viewModel: FeedCardViewModel) {
        self.infoLabel.text = viewModel.info
        self.titleLabel.text = viewModel.title
        self.shortDescriptionLabel.text = viewModel.shortDescription
        self.imageView.setImage(with: URL(string: viewModel.imageName))
        self.setNeedsLayout()
    }
}

private struct Constants {
    static let margin: CGFloat = 16
}
