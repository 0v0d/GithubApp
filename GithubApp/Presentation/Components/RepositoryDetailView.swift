//
//  RepositoryDetailView.swift
//  GithubApp
//
//  Created by 0v0 on 2026/02/23.
//

import SwiftUI

struct RepositoryDetailView: View {
    let item: GithubItem

    var body: some View {
        Form {
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

                        Text(item.description ?? "No description")
                            .foregroundStyle(.secondary)
                            .lineLimit(2)
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)

                            Text(getFormattedCount(count: item.stargazersCount))

                            Text(item.language ?? "Unknown")
                                .foregroundStyle(.blue)

                        }.padding(.top, 4)

                    }.padding(.leading, 12)
                }
            }
        }
    }
}

#Preview {
    RepositoryDetailView(item: GithubItem.mock)
}
