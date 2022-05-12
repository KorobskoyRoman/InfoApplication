//
//  FeedRouter.swift
//  InfoApplication
//
//  Created by Roman Korobskoy on 09.05.2022.
//  
//

import UIKit

final class FeedRouter: BaseRouter {
}

extension FeedRouter: FeedRouterInput {
    func showLogin() {
        let context = LoginContext(moduleOutput: self)
        let containter = LoginContainer.assemble(with: context)
        let navVC = UINavigationController(rootViewController: containter.viewController)
        self.navigationController?.present(navVC, animated: true)
    }
}

extension FeedRouter: LoginModuleOutput {
    func loginModuleDidFinish() {
        self.navigationController?.dismiss(animated: true)
    }
}
