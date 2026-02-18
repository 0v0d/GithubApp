//
//  Github​Domain​Models​+Mock.swift
//  GithubApp
//
//  Created by 0v0 on 2026/02/23.
//

import Foundation

extension GithubItem {
    static let mock =
        GithubItem(
            name: "Name",
            fullName: "test/test",
            description: "descriptiondescriptiondescriptiondescriptiondescription",
            stargazersCount: 23,
            language: "kotlin",
            htmlURL: "test",
            owner: GithubOwner(
                login: "test",
                avatarURL: URL(string: "https://avatars.githubusercontent.com/u/1342004?v=4")!,
                htmlURL: URL(string: "https://www.youtube.com/")!
            )
        )
}
