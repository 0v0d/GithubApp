//
//  GithubListView.swift
//  GithubApp
//
//  Created by 0v0 on 2026/02/15.
//

import SwiftUI

struct GithubListView: View {
    @State private var viewModel = GithubListViewModel()
    @State private var searchText: String = ""
    @State private var isSearchPresented: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    LoadingView()
                } else if let error = viewModel.errorMessage {
                    ErrorView(message: error, onDismiss: viewModel.clearError)
                } else if let githubList = viewModel.githubList {
                    GithubItemListView(list: githubList)
                } else {
                    Text("リポジトリを検索してみましょう!")
                }
            }
            .navigationTitle("リポジトリ一覧")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(
                text: $searchText,
                isPresented: $isSearchPresented,
                placement: .toolbar,
                prompt: "リポジトリを検索..."
            )
            .onSubmit(of: .search) {
                isSearchPresented = false
                Task {
                    await viewModel.fetchGithubList(for: searchText)
                }
            }
        }
    }
}

struct GithubItemListView: View {
    let list: [GithubItem]

    var body: some View {
        List(list) { item in
            NavigationLink(value: item) {
                RepositoryItemView(item: item)
            }
        }.navigationDestination(for: GithubItem.self) {
            value in
            RepositoryDetailView(item: value)
        }
    }
}

struct RepositoryItemView: View {
    let item: GithubItem

    var body: some View {
        VStack {
            HStack(alignment: .top) {
                AsyncImage(url: item.owner.avatarURL) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 50, height: 50)
                .clipShape(Circle())

                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.title2)

                    Text(item.owner.login)

                    Text(item.description ?? "No description")
                        .foregroundStyle(.secondary)
                        .lineLimit(2)
                        .font(.caption)

                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)

                        Text(getFormattedCount(count: item.stargazersCount))

                        Text(item.language ?? "Unknown")
                            .foregroundStyle(.blue)

                    }.padding(.top, 2)

                }.padding(.leading, 12)
            }
        }
    }
}

#Preview {
    GithubListView()
}
