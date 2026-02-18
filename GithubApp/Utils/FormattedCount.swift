//
//  FormattedCount.swift
//  GithubApp
//
//  Created by 0v0 on 2026/02/23.
//

import Foundation

func getFormattedCount(count: Int) -> String {
    if count < 1000 {
        String(count)
    } else if count < 1_000_000 {
        String(format: "%.1fK", Float(count) / 1000.0)
    } else {
        String(format: "%.1fM", Float(count) / 1_000_000.0)
    }
}
