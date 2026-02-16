//
//  GithubViewModel.swift
//  GithubApp
//
//  Created by 0v0 on 2026/02/14.
//

import Foundation
import Observation

@MainActor
@Observable
final class GithubListViewModel{
    private(set) var githubList: [GithubItem]?
    private(set) var isLoading = false
    private(set) var errorMessage: String?

    @ObservationIgnored
    private let githubRepository: GithubRepositoryClient

    init(githubRepository: GithubRepositoryClient = .live) {
        self.githubRepository = githubRepository
    }

    func fetchGithubList(for keyword:String) async {
        guard !keyword.isEmpty else {
            return
        }

        isLoading = true
        errorMessage = nil

        defer { isLoading = false }
        
        do {
            githubList = try await githubRepository.fetchRepositories(keyword)
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func clearError() {
        errorMessage = nil
    }
}
