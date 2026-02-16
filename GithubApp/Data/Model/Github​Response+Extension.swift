//
//  Github​Response + Extension.swift
//  GithubApp
//
//  Created by 0v0 on 2026/02/16.
//

extension GithubResponseItem {
    nonisolated func toDomain() -> GithubItem {
        return GithubItem(
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
        return GithubOwner(
            login: login,
            avatarURL: avatarURL,
            htmlURL: htmlURL)
    }
}
