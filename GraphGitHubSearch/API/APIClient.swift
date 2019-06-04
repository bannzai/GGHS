//
//  APIClient.swift
//  GraphGitHubSearch
//
//  Created by Yutaro Muta on 2019/06/04.
//  Copyright © 2019 yutailang0119. All rights reserved.
//

import Foundation

struct APIClient {

    private let session: URLSession

    private let token = "You Token"

    init(session: URLSession? = nil) {
        if let session = session {
            self.session = session
        } else {
            let configuration = URLSessionConfiguration.default
            configuration.httpAdditionalHeaders = ["Authorization": "bearer \(token)"]
            self.session = URLSession(configuration: configuration)

        }
    }

    func execute<Q: Query>(by query: Q,
                           completionHandler: @escaping (Result<Q.Response, Never>) -> Void) {
        let task = session.dataTask(with: query.urlRequest) { data, urlResponse, error in
            guard let httpURLResponse = urlResponse as? HTTPURLResponse,
                (200..<300).contains(httpURLResponse.statusCode),
                let data = data else {
                    fatalError()
            }
            do {
                let value = try JSONDecoder().decode(Q.Response.self, from: data)
                completionHandler(.success(value))
            } catch {
                fatalError()
            }
        }
        task.resume()
    }

}
