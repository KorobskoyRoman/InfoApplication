//
//  LoginViewController.swift
//  InfoApplication
//
//  Created by Roman Korobskoy on 12.05.2022.
//  
//

import UIKit
import AuthenticationServices

final class LoginViewController: UIViewController {
	private let output: LoginViewOutput

    private let buttonsFactory = SocialButtonFactory()
    private lazy var authButton = self.buttonsFactory.makeApple()
    
    init(output: LoginViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.authButton.map { self.view.addSubview($0) }
    }
    
	override func viewDidLoad() {
		super.viewDidLoad()
        
        self.title = Localization.loginTitle
        self.view.backgroundColor = .white
        self.navigationItem.rightBarButtonItem = BlockBarButtonItem.item(title: Localization.closeButton,
                                                                         style: .done,
                                                                         handler: { [weak self] in
            self?.output.onCloseTap()
        })
        
        self.authButton?.addTarget(self, action: #selector(onAuthTap), for: .touchUpInside)
	}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        authButton?.center = self.view.center
    }
    
    @objc private func onAuthTap() {
        self.output.onAuthTap()
    }
}

extension LoginViewController: LoginViewInput {
}
