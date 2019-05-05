//
//  APIManager.swift
//  Foresight
//
//  Created by Cary Zhou on 5/4/19.
//  Copyright © 2019 Many Hats. All rights reserved.
//

import Foundation

protocol APIManagerDelegate: class {
    func didFinishCall()
}

class APIManager {
    static let shared = APIManager()
    init() { }

    // Key : API Response dictionary
    var cache: [String : Codable] = [:]
    weak var delegate: APIManagerDelegate?

    func makeUrlRequest(endpoint: String, queryParams: [String : String]? = nil) -> URL? {
        guard var url = URLComponents(string: endpoint),
            let urlString = url.string else { return nil }

        guard let params = queryParams else {
            return URL(string: urlString)
        }

        for entry in params {
            url.queryItems?.append(URLQueryItem(name: entry.key, value: entry.value))
        }

        return URL(string: url.string ?? "")
    }

    func makeApiCall(url: URL, completion: @escaping ((_ data: Data?) -> Void)) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            completion(data)
            self.delegate?.didFinishCall()
        })

        task.resume()
    }
}
