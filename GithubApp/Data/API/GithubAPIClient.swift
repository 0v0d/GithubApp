//
//  GithubAPIClient.swift
//  GithubApp
//
//  Created by 0v0 on 2026/02/15.
//

import Foundation

protocol GithubAPIClientProtocol: Sendable {
    func fetchGitHubRepositories(for keyword:String)async throws -> GithubResponse
}

final class GithubAPIClient : GithubAPIClientProtocol {
    private let baseURL = "https://api.github.com"

    func fetchGitHubRepositories(for keyword: String) async throws -> GithubResponse {
        guard let encoded = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "\(baseURL)/search/repositories?q=\(encoded)") else {
            throw APIError.invalidURL
        }
        return try await requestAPI(url: url)
    }

    private func requestAPI(url: URL) async throws -> GithubResponse {
        let data: Data
        let response: URLResponse
        do {
            (data, response) = try await URLSession.shared.data(from: url)
        } catch {
            throw APIError.networkError(error)
        }


        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        switch httpResponse.statusCode {
        case 200:
            do {
                let decoder = JSONDecoder()
                return try decoder.decode(GithubResponse.self, from: data)
            } catch {
                throw APIError.decodingError(error)
            }
        case 429:
            throw APIError.rateLimitExceeded
        default:
            throw APIError.serverError(statusCode: httpResponse.statusCode)
        }
    }
}
