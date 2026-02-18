//
//  ErrorView.swift
//  GithubApp
//
//  Created by 0v0 on 2026/02/22.
//

import SwiftUI

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
            .glassEffect()
        }
        .padding(32)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
        .padding()
    }
}

#Preview {
    ErrorView(message: "testtetetetetetettttttt", onDismiss: {})
}
