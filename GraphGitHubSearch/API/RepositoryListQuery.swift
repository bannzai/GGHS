//
//  RepositoryListQuery.swift
//  GraphGitHubSearch
//
//  Created by Yutaro Muta on 2019/06/05.
//  Copyright © 2019 yutailang0119. All rights reserved.
//

import Foundation

struct SearchRepositoryQuery: Query {
    typealias Response = SearchRepositoryQueryResponse

    private let keyword: String

    init(keyword: String) {
        self.keyword = keyword
    }

    var urlRequest: URLRequest {
        var request = URLRequest(url: rootEndpont)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = query
        return request
    }

    private var query: Data {
        let query = #"""
        query {
            search(query: "Kaeru", first: 30, type: REPOSITORY) {
                edges {
                    node {
                        ... on Repository {
                            id
                            name
                            openGraphImageUrl
                            shortDescriptionHTML
                            url
                            owner {
                                login
                            }
                        }
                    }
                }
            }
        }
        """#
        let operation = ["query": query]
        guard let raw = try? JSONSerialization.data(withJSONObject: operation, options: []) else {
            fatalError("JSON Serialization Error")
        }
        return raw
    }

}
