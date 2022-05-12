//
//  FeedProtocols.swift
//  InfoApplication
//
//  Created by Roman Korobskoy on 09.05.2022.
//  
//

import Foundation

enum LoadingDataType {
    case nexPage
    case reload
}

protocol FeedModuleInput {
	var moduleOutput: FeedModuleOutput? { get }
}

protocol FeedModuleOutput: AnyObject {
}

protocol FeedViewInput: AnyObject {
    func set(viewModels: [FeedCardViewModel])
}

protocol FeedViewOutput: AnyObject {
    func viewDidLoad()
    func willDisplay(at index: Int)
    func onLoginTap()
}

protocol FeedInteractorInput: AnyObject {
    func reload()
    func loadNext()
}

protocol FeedInteractorOutput: AnyObject {
    func didEncounterError(_ error: Error)
    func didLoad(_ articles: [Article], loadType: LoadingDataType)
}

protocol FeedRouterInput: AnyObject {
    func showLogin()
}
