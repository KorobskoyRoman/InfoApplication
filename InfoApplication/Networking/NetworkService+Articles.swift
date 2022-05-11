//
//  NetworkService+Articles.swift
//  InfoApplication
//
//  Created by Roman Korobskoy on 10.05.2022.
//

import Foundation

extension NetworkService: ArticlesNetworkProtocol {
    func requestArticles(params: ArticlesRequestParams, completion: @escaping (Result<ArticlesResponse, Error>) -> Void) {
        let url = URLFactory.articles(params: params)
        self.baseRequest(url: url, completion: completion)
    }
}
