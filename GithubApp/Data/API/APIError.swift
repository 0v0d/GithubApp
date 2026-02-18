//
//  APIError.swift
//  GithubApp
//
//  Created by 0v0 on 2026/02/15.
//

import Foundation

enum APIError: LocalizedError {
    case invalidURL
    case networkError(Error)
    case invalidResponse
    case decodingError(Error)
    case serverError(statusCode: Int)
    case rateLimitExceeded

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            "Invalid URL"
        case let .networkError(error):
            "Network error: \(error.localizedDescription)"
        case .invalidResponse:
            "Invalid response from server"
        case let .decodingError(error):
            "Failed to decode response: \(error.localizedDescription)"
        case let .serverError(statusCode):
            "Server error with status code: \(statusCode)"
        case .rateLimitExceeded:
            "Rate limit exceeded"
        }
    }
}
