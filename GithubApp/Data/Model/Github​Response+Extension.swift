//
//  Github​Response + Extension.swift
//  GithubApp
//
//  Created by 0v0 on 2026/02/16.
//

import Foundation

extension GithubResponseItem {
    nonisolated func toDomain() -> GithubItem {
        GithubItem(
            name: name,
            fullName: fullName,
            description: description,
            stargazersCount: stargazersCount,
            language: language,
            htmlURL: htmlURL,
            owner: owner.toDomain()
        )
    }
}

extension GithubResponseOwner {
    nonisolated func toDomain() -> GithubOwner {
        GithubOwner(
            login: login,
            avatarURL: URL(string: avatarURL),
            htmlURL: URL(string: htmlURL)
        )
    }
}
