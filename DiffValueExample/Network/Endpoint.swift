//
//  Endpoint.swift
//  DiffValueExample
//
//  Created by Haider Khan on 3/8/20.
//  Copyright © 2020 zkhaider. All rights reserved.
//

import Foundation

public protocol Endpoint {
    var components: URLComponents { get }
    var url: URL { get }
}

enum HackerNewsEndpoints: Endpoint {
    
    case topStories
    case story(storyId: Int)
    
    var components: URLComponents {
        switch self {
        case .topStories:
            var urlComponents = URLComponents(
                url: HackerNewsAPI.baseURL.appendingPathComponent("topstories.json"),
                resolvingAgainstBaseURL: true
            )
            urlComponents?.queryItems = [
                URLQueryItem(name: "print", value: "pretty")
            ]
            return urlComponents!
        case .story(let storyId):
            var urlComponents = URLComponents(
                url: HackerNewsAPI.baseURL.appendingPathComponent("item/\(storyId).json"),
                resolvingAgainstBaseURL: true
            )
            urlComponents?.queryItems = [
                URLQueryItem(name: "print", value: "pretty")
            ]
            return urlComponents!
        }
    }
    
    var url: URL {
        return components.url!
    }
    
}
