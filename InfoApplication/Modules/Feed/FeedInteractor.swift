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
    
    init(articlesNetworkService: ArticlesNetworkProtocol) {
        self.articlesNetworkService = articlesNetworkService
    }
}

extension FeedInteractor: FeedInteractorInput {
    func loadArticles() {
        self.articlesNetworkService.requestArticles { result in
            switch result {
            case .success(let response):
                self.output?.didLoad(response.articles)
            case .failure(let error):
                self.output?.didEncounterError(error)
            }
        }
    }
}
