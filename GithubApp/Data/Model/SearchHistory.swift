//
//  SearchHistory.swift
//  GithubApp
//
//  Created by 0v0 on 2026/03/02.
//

import Foundation
import SwiftData

@Model
final class SearchHistory {
    var keyword: String
    var searchedAt: Date

    init(keyword: String, searchedAt: Date = .now) {
        self.keyword = keyword
        self.searchedAt = searchedAt
    }
}
