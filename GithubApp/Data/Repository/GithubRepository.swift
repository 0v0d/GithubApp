//
//  GithubRepository.swift
//  GithubApp
//
//  Created by 0v0 on 2026/02/14.
//

import Foundation

final class GithubRepository: GithubRepositoryProtocol, Sendable {
    private let githubAPIClient: any GithubAPIClientProtocol

    init(githubAPIClient: any GithubAPIClientProtocol = GithubAPIClient()) {
        self.githubAPIClient = githubAPIClient
    }

    func fetchGitHubRepositories(for keyword: String) async throws -> [GithubItem] {
        let response = try await githubAPIClient.fetchGitHubRepositories(for: keyword)
        return response.items.map { $0.toDomain() }
    }
}
