//
//  Query.swift
//  GraphGitHubSearch
//
//  Created by Yutaro Muta on 2019/06/05.
//  Copyright © 2019 yutailang0119. All rights reserved.
//

import Foundation

protocol Query {
    associatedtype Response: Decodable
    var rootEndpont: URL { get }
    var urlRequest: URLRequest { get }
}

extension Query {
    var rootEndpont: URL {
        return URL(string: "https://api.github.com/graphql")!
    }
}
