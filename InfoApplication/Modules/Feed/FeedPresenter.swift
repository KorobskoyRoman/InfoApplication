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
    
    private var isNextPageLoading = false
    private var isReloading = false
    
    private var articles: [Article] = []
    private var hasNextPage = true
    
    init(router: FeedRouterInput, interactor: FeedInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension FeedPresenter: FeedModuleInput {
}

extension FeedPresenter: FeedViewOutput {
    func willDisplay(at index: Int) {
        guard !isReloading,
              !isNextPageLoading,
              (articles.count - index) < 10
        else { return }
        isNextPageLoading = true
        interactor.loadNext()
    }
    
    func viewDidLoad() {
        isReloading = true
        interactor.reload()
    }
}

extension FeedPresenter: FeedInteractorOutput {
    func didEncounterError(_ error: Error) {
        //
    }
    
    func didLoad(_ articles: [Article], loadType: LoadingDataType) {
        switch loadType {
        case .nexPage:
            isNextPageLoading = false
            hasNextPage = articles.count > 0
            self.articles.append(contentsOf: articles)
        case .reload:
            isReloading = false
            self.articles = articles
        }
        
        let viewModels: [FeedCardViewModel] = self.makeViewModels(self.articles)
        self.view?.set(viewModels: viewModels)
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
