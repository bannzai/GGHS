//
//  SearchRepositoryQueryResponse.swift
//  GraphGitHubSearch
//
//  Created by Yutaro Muta on 2019/06/05.
//  Copyright © 2019 yutailang0119. All rights reserved.
//

import Foundation

struct SearchRepositoryQueryResponse: Codable {
    let data: RepositoryListData
}

struct RepositoryListData: Codable {
    let search: RepositoryListSearch
}

struct RepositoryListSearch: Codable {
    let edges: [RepositoryListEdge]
}

struct RepositoryListEdge: Codable {
    let node: RepositoryListNode
}

struct RepositoryListNode: Codable {
    let id: String
    let name: String
    let imageURL: String
    let shortDescription: String
    let url: String
    let owner: RepositoryOwner

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case url = "url"
        case imageURL = "openGraphImageUrl"
        case shortDescription = "shortDescriptionHTML"
        case owner = "owner"
    }
}

struct RepositoryOwner: Codable {
    let login: String
}
