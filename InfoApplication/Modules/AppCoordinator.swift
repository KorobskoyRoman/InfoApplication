//
//  AppCoordinator.swift
//  InfoApplication
//
//  Created by Roman Korobskoy on 10.05.2022.
//

import UIKit

class AppCoordinator {
    
    private let appDependency: AppDependency
    private let window: UIWindow
    private lazy var tabBarController = UITabBarController()
    private lazy var navigationControllers = AppCoordinator.makeNavigationControllers()
    
    init(window: UIWindow, appDependency: AppDependency) {
        self.window = window
        self.appDependency = appDependency
        self.setupAppearence()
    }
    
    func start() {
        setupFeed()
        setupPrize()
        let navigationControllers = NavControllerType.allCases.compactMap { self.navigationControllers[$0] }
        self.tabBarController.setViewControllers(navigationControllers, animated: true)
        window.rootViewController = self.tabBarController
        window.makeKeyAndVisible()
    }
}

private extension AppCoordinator {
    
    func setupAppearence() {
        UINavigationBar.appearance().barTintColor = .black
        UINavigationBar.appearance().tintColor = .black
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        UINavigationBar.appearance().shadowImage = UIImage()
        
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().tintColor = .systemGreen
    }
    
    func setupFeed() {
        guard let navController = self.navigationControllers[.feed] else {
            fatalError("cant' find navController")
        }
        let contex = FeedContext(moduleDependencies: self.appDependency, moduleOutput: nil)
        let container = FeedContainer.assemble(with: contex)
        
        navController.setViewControllers([container.viewController], animated: true)
        container.viewController.navigationItem.title = NavControllerType.feed.title
    }
    
    func setupPrize() {
        guard let navController = self.navigationControllers[.prize] else {
            fatalError("cant' find navController")
        }
        let viewController = UIViewController()
        viewController.view.backgroundColor = .brown
        
        navController.setViewControllers([viewController], animated: true)
        viewController.navigationItem.title = NavControllerType.prize.title
    }
    
    static func makeNavigationControllers() -> [NavControllerType: UINavigationController] {
        var result: [NavControllerType: UINavigationController] = [:]
        NavControllerType.allCases.forEach { navControllerKey in
            let navigationController = UINavigationController()
            let TabBarItem = UITabBarItem(title: navControllerKey.title,
                                          image: navControllerKey.image,
                                          tag: navControllerKey.rawValue)
            navigationController.tabBarItem = TabBarItem
            navigationController.navigationBar.prefersLargeTitles = true
            result[navControllerKey] = navigationController
        }
        return result
    }
}

fileprivate enum NavControllerType: Int, CaseIterable {
    case feed, prize, video, thumbsUp, podcasts
    
    var title: String {
        switch self {
        case .feed:
            return Localization.feed
        case .prize:
            return Localization.prize
        case .video:
            return Localization.video
        case .thumbsUp:
            return Localization.thumbsUp
        case .podcasts:
            return Localization.podcasts
        }
    }
    
    var image: UIImage? {
        switch self {
        case .feed:
            return UIImage(systemName: "newspaper")
        case .prize:
            return UIImage(systemName: "giftcard")
        case .video:
            return UIImage(systemName: "video.square")
        case .thumbsUp:
            return UIImage(systemName: "hand.thumbsup.circle")
        case .podcasts:
            return UIImage(systemName: "airpodsmax")
        }
    }
}
