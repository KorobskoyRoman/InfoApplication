//
//  NetworkService+Articles.swift
//  InfoApplication
//
//  Created by Roman Korobskoy on 10.05.2022.
//

import Foundation

extension NetworkService: ArticlesNetworkProtocol {
    func requestArticles(completion: @escaping (Result<ArticlesResponse, Error>) -> Void) {
        let params = URLQueryItem(name: "q", value: "world")
        let url = "\(urlFactory.articles)&\(params)"
        baseRequest(url: url, completion: completion)
    }
}
