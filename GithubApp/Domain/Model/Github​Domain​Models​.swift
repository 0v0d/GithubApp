//
//  Github​Domain​Models​.swift
//  GithubApp
//
//  Created by 0v0 on 2026/02/16.
//

import Foundation

struct GithubItem: Identifiable, Sendable, Hashable {
    let id: UUID
    let name: String
    let fullName: String
    let description: String?
    let stargazersCount: Int
    let language: String?
    let htmlURL: String
    let owner: GithubOwner

    nonisolated init(
        id: UUID = UUID(),
        name: String,
        fullName: String,
        description: String?,
        stargazersCount: Int,
        language: String?,
        htmlURL: String,
        owner: GithubOwner
    ) {
        self.id = id
        self.name = name
        self.fullName = fullName
        self.description = description
        self.stargazersCount = stargazersCount
        self.language = language
        self.htmlURL = htmlURL
        self.owner = owner
    }
}

struct GithubOwner: Hashable, Sendable {
    let login: String
    let avatarURL: URL?
    let htmlURL: URL?
}
