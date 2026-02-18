//
//  GithubResponse.swift
//  GithubApp
//
//  Created by 0v0 on 2026/02/14.
//

import Foundation

struct GithubResponse: Decodable, Sendable {
    let items: [GithubResponseItem]
}

struct GithubResponseItem: Sendable, Decodable {
    let name: String
    let fullName: String
    let description: String?
    let stargazersCount: Int
    let language: String?
    let htmlURL: String
    let owner: GithubResponseOwner

    enum CodingKeys: String, CodingKey {
        case name
        case fullName = "full_name"
        case description
        case stargazersCount = "stargazers_count"
        case language
        case htmlURL = "html_url"
        case owner
    }
}

struct GithubResponseOwner: Sendable, Decodable {
    let login: String
    let avatarURL: String
    let htmlURL: String

    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
        case htmlURL = "html_url"
    }
}
