//
//  DependencyContainer.swift
//  GithubApp
//
//  Created by 0v0 on 2026/02/15.
//

import Foundation
import Dependencies

struct GithubRepositoryClient: Sendable {
    var fetchRepositories: @Sendable (String) async throws ->[GithubItem]

    static let live = GithubRepositoryClient(
        fetchRepositories: { keyword in
            let repository = await GithubRepository(
                githubAPIClient: GithubAPIClient()
            )
            let response = try await repository.fetchGitHubRepositories(for: keyword)
            return response.items.map { $0.toDomain() }
        }
    )
}

private enum GithubRepositoryKey: DependencyKey {
    static let liveValue = GithubRepositoryClient.live
}

extension DependencyValues {
    var githubRepository: GithubRepositoryClient {
        get { self[GithubRepositoryKey.self] }
        set { self[GithubRepositoryKey.self] = newValue }
    }
}
