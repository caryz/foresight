//
//  APIManager.swift
//  Foresight
//
//  Created by Cary Zhou on 5/4/19.
//  Copyright © 2019 Many Hats. All rights reserved.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    init() { }

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

    func makeApiCall(url: URL, completion: ((Any) -> Void)) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print(response!)
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                print(json)
            } catch {
                print("error")
            }
        })

        task.resume()
    }
}


