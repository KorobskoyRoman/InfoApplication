//
//  FeedViewController.swift
//  InfoApplication
//
//  Created by Roman Korobskoy on 09.05.2022.
//  
//

import UIKit

final class FeedViewController: UIViewController {
	private let output: FeedViewOutput

    init(output: FeedViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
	override func viewDidLoad() {
		super.viewDidLoad()
        view.backgroundColor = .systemRed
	}
}

extension FeedViewController: FeedViewInput {
}
