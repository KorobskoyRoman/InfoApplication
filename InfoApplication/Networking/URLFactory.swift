//
//  URLFactory.swift
//  InfoApplication
//
//  Created by Roman Korobskoy on 10.05.2022.
//

import Foundation

struct URLFactory {
    private static let apiKey = "adab569a5e6e442da872664e3ab15f6d"
    private let urlComponents: URLComponents
    
    let articles: String
    
    init(baseUrl: URL = URL(string: "https://newsapi.org/v2/")!) {
        let queryItem = URLQueryItem(name: "apiKey", value: URLFactory.apiKey)
        var urlComponents = URLComponents(url: baseUrl, resolvingAgainstBaseURL: false)!
        urlComponents.queryItems = [queryItem]
        
        self.urlComponents = urlComponents
        self.articles = urlComponents.url!.appendingPathComponent("everything").absoluteString
    }
}
