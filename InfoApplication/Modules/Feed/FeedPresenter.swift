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
    
    private var articles: [Article] = []
    
    init(router: FeedRouterInput, interactor: FeedInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension FeedPresenter: FeedModuleInput {
}

extension FeedPresenter: FeedViewOutput {
    func viewDidLoad() {
        self.interactor.loadArticles()
    }
}

extension FeedPresenter: FeedInteractorOutput {
    func didEncounterError(_ error: Error) {
        //
    }
    
    func didLoad(_ articles: [Article]) {
        self.articles = articles
        let viewModels: [FeedCardViewModel] = self.makeViewModels(self.articles)
        self.view?.set(viewModels: viewModels)
        print(self.articles.count)
    }
}

private extension FeedPresenter {
    func makeViewModels(_ articles: [Article]) -> [FeedCardViewModel] {
        return articles.map { article in
            FeedCardViewModel(info: "info",
                              title: article.title ?? "",
                              shortDescription: article.description ?? "",
                              imageName: article.urlToImage ?? "")
        }
    }
}
