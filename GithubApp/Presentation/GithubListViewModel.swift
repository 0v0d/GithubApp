//
//  GithubListViewModel.swift
//  GithubApp
//
//  Created by 0v0 on 2026/02/14.
//

import Foundation
import Observation

@MainActor
@Observable
final class GithubListViewModel {
    private(set) var githubList: [GithubItem]?
    private(set) var isLoading = false
    private(set) var errorMessage: String?

    @ObservationIgnored
    private let githubRepository: GithubRepositoryProtocol

    @ObservationIgnored
    private var lastSearchedKeyword: String?

    init(githubRepository: GithubRepositoryProtocol = GithubRepository()) {
        self.githubRepository = githubRepository
    }

    func fetchGithubList(for keyword: String) async {
        clearError()
        guard !keyword.isEmpty else {
            return
        }

        // 同じキーワードで既に取得済みなら再検索しない
        guard keyword != lastSearchedKeyword else {
            return
        }

        isLoading = true

        defer { isLoading = false }

        do {
            githubList = try await githubRepository.fetchGitHubRepositories(for: keyword)
            lastSearchedKeyword = keyword
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func clearError() {
        errorMessage = nil
    }
}
