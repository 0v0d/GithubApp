//
//  GithubRepositoryProtocol.swift
//  GithubApp
//
//  Created by 0v0 on 2026/02/16.
//

protocol GithubRepositoryProtocol: Sendable {
    func fetchGitHubRepositories(for keyword: String) async throws -> [GithubItem]
}
