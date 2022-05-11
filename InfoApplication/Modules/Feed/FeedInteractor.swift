//
//  FeedInteractor.swift
//  InfoApplication
//
//  Created by Roman Korobskoy on 09.05.2022.
//  
//

import Foundation

final class FeedInteractor {
	weak var output: FeedInteractorOutput?
    
    private let articlesNetworkService: ArticlesNetworkProtocol
    
    private var page: Int = Constants.initialPage
    
    init(articlesNetworkService: ArticlesNetworkProtocol) {
        self.articlesNetworkService = articlesNetworkService
    }
}

extension FeedInteractor: FeedInteractorInput {
    func reload() {
        page = Constants.initialPage
        load()
    }
    
    func loadNext() {
        load()
    }
}

private extension FeedInteractor {
    func load() {
        let params = ArticlesRequestParams(pageSizze: 20, page: page, search: "world")
        self.articlesNetworkService.requestArticles(params: params) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.output?.didLoad(response.articles, loadType: self.page == Constants.initialPage  ? .reload : .nexPage)
                self.page += 1
            case .failure(let error):
                self.output?.didEncounterError(error)
            }
        }
    }
}

private enum Constants {
    static let initialPage = 1
}
