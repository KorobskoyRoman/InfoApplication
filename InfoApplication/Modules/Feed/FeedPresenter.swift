//
//  FeedPresenter.swift
//  InfoApplication
//
//  Created by Roman Korobskoy on 09.05.2022.
//  
//

import Foundation

final class FeedPresenter {
	weak var view: FeedViewInput?
    weak var moduleOutput: FeedModuleOutput?
    
	private let router: FeedRouterInput
	private let interactor: FeedInteractorInput
    
    init(router: FeedRouterInput, interactor: FeedInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension FeedPresenter: FeedModuleInput {
    func viewDidLoad() {
        self.view?.set(viewModels: self.makeViewModels())
    }
}

extension FeedPresenter: FeedViewOutput {
}

extension FeedPresenter: FeedInteractorOutput {
}

private extension FeedPresenter {
    func makeViewModels() -> [FeedCardViewModel]{
        return [
            FeedCardViewModel(info: "News", title: "news 123123 213123123 12312", shortDescription: "short description 1", imageName: "image"),
            FeedCardViewModel(info: "News", title: "news 123123 213123123 12312", shortDescription: "short description 1", imageName: "image"),
            FeedCardViewModel(info: "News", title: "news 123123 213123123 12312", shortDescription: "short description 1", imageName: "image")]
    }
}
