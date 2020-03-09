//
//  Network.Endpoints.swift
//  DiffValueExample
//
//  Created by Haider Khan on 3/8/20.
//  Copyright © 2020 zkhaider. All rights reserved.
//

import Foundation

public enum NetworkError: Error {
    case error
    case hostNotFound
    case decodingError
}

public protocol Routable {
    associatedtype Endpoints: Endpoint
    static var baseURL: URL { get }
    static func fetch<T: Codable>(on: Endpoints) -> Effect<Result<T, NetworkError>>
}

struct HackerNewsAPI: Routable {
    
    static var baseURL: URL {
        return URL(string: "https://hacker-news.firebaseio.com/v0/")!
    }
}

internal let jsonDecoder = JSONDecoder()

extension HackerNewsAPI {
    
    public static func fetch<T: Codable>(
        on: HackerNewsEndpoints) -> Effect<Result<T, NetworkError>>
    {
        let request = URLRequest(url: on.url)
        return Effect { callback in
            URLSession.shared.dataTask(
            with: request) { (data, response, error) in
                
                guard
                    error == nil,
                    let data = data
                    else {
                        return callback(.failure(.error))
                }
                
                guard
                    let decoded = try? jsonDecoder.decode(T.self, from: data)
                    else {
                        return callback(.failure(.decodingError))
                }
                
                callback(.success(decoded))
            }.resume()
        }
    }
    
}
