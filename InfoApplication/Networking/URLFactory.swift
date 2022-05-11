//
//  URLFactory.swift
//  InfoApplication
//
//  Created by Roman Korobskoy on 10.05.2022.
//

import Foundation

struct URLFactory {
    private static let apiKey = "adab569a5e6e442da872664e3ab15f6d"
    private static var baseUrl: URL {
        return baseUrlComponents.url!
    }
    private static let baseUrlComponents: URLComponents = {
        let url = URL(string: "https://newsapi.org/v2/")!
        let queryItem = URLQueryItem(name: "apiKey", value: URLFactory.apiKey)
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        urlComponents.queryItems = [queryItem]
        return urlComponents
    }()
    
    
    static func articles(params: ArticlesRequestParams) -> String {
        let params = [URLQueryItem(name: "pageSize", value: "\(params.pageSizze)"),
                      URLQueryItem(name: "page", value: "\(params.page)"),
                      URLQueryItem(name: "q", value: params.search)]
        var urlComponents = baseUrlComponents
        urlComponents.queryItems?.append(contentsOf: params)
        return urlComponents.url!.appendingPathComponent("everything").absoluteString
    }
}
