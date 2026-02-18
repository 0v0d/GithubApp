//
//  LoadingView.swift
//  GithubApp
//
//  Created by 0v0 on 2026/02/22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 16) {
            ProgressView()
                .progressViewStyle(.circular)
                .tint(.white)

            Text("Loading...")
                .font(.subheadline)
                .foregroundStyle(.white)
        }
        .padding(40)
        .background(Color(.gray), in: RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    LoadingView()
}
