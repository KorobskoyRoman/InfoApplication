//
//  NetworkServiceProtocols.swift
//  InfoApplication
//
//  Created by Roman Korobskoy on 10.05.2022.
//

import Foundation

struct ArticlesRequestParams {
    let pageSizze: Int
    let page: Int
    let search: String
}

protocol ArticlesNetworkProtocol {
    func requestArticles(params: ArticlesRequestParams,completion: @escaping (Result<ArticlesResponse, Error>) -> Void)
}

struct ArticlesResponse: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let identifier: String = UUID().uuidString
    let title: String?
    let description: String?
    let urlToImage: String?
    let content: String?
}
