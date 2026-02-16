//
//  GithubListView.swift
//  GithubApp
//
//  Created by 0v0 on 2026/02/15.
//

import SwiftUI

struct GithubListView: View {
    @State private var viewModel = GithubListViewModel()

    var body: some View {
        VStack{
            if viewModel.isLoading {
                LoadingView()
            } else if let error = viewModel.errorMessage {
                ErrorView(message: error) {
                    viewModel.clearError()
                }
            } else if let githubList = viewModel.githubList {
                GithubItemListView(list:githubList)
            } else {
                EmptyView()
            }
        }.task {
            if viewModel.githubList == nil {
                await viewModel.fetchGithubList(for: "kotlin")
            }
        }
    }
}


struct GithubItemListView:View {
    let list:[GithubItem]

    var body: some View {
        List (list){ item in
            Text(item.name)
        }
    }
}


struct LoadingView: View {
    var body: some View {
        VStack(spacing: 16) {
            ProgressView()
                .progressViewStyle(.circular)
                .scaleEffect(1.5)
                .tint(.white)

            Text("Loading...")
                .font(.subheadline)
                .foregroundStyle(.white)
        }
        .padding(40)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
    }
}

struct ErrorView: View {
    let message: String
    let onDismiss: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 40))
                .foregroundStyle(.orange)

            Text("Error")
                .font(.headline)

            Text(message)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)

            Button("Dismiss") {
                onDismiss()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding(24)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
        .padding()
    }
}
