//
//  HorizontalContainerVariantView.swift
//  SwiftUI boilerplate
//
//  Created by Eric Yuan on 02/05/2026.
//

import AtomicSwiftUISDK
import SwiftUI

struct HorizontalContainerVariantView: View {
    @State private var isPresentingSheet = false

    private let cardWidth: CGFloat = 350

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                HorizontalPlaceholder(title: "Top content", systemImage: "photo")

                NavigationLink {
                    HorizontalSecondaryView(cardWidth: cardWidth)
                        .navigationTitle("Secondary page")
                        .navigationBarTitleDisplayMode(.inline)
                } label: {
                    Label("To the secondary page", systemImage: "chevron.right")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()

                horizontalContainer(cardWidth: cardWidth)

                VStack(spacing: 0) {
                    ForEach(0..<15, id: \.self) { index in
                        HorizontalPlaceholder(title: "Page content \(index + 1)", systemImage: "rectangle")
                    }
                }
                .padding(.top, 10)
            }
        }
        .navigationTitle("Notifications")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    isPresentingSheet = true
                } label: {
                    Image(systemName: "bell.badge")
                }
                .accessibilityLabel("Open horizontal container sheet")
            }
        }
        .sheet(isPresented: $isPresentingSheet) {
            HorizontalSecondaryView(cardWidth: cardWidth)
        }
    }
}

private struct HorizontalSecondaryView: View {
    let cardWidth: CGFloat

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                HorizontalPlaceholder(title: "Secondary top content", systemImage: "photo")
                horizontalContainer(cardWidth: cardWidth)

                VStack(spacing: 0) {
                    ForEach(0..<5, id: \.self) { index in
                        HorizontalPlaceholder(title: "Secondary content \(index + 1)", systemImage: "rectangle")
                    }
                }
                .padding(.top, 10)
            }
        }
    }
}

@ViewBuilder private func horizontalContainer(cardWidth: CGFloat) -> some View {
    if canDisplayAtomicContainerExamples {
        HorizontalContainer(
            containerId: AtomicSettings.containerId,
            cardWidth: cardWidth
        )
    } else {
        AtomicSettingsRequiredView()
    }
}

private struct HorizontalPlaceholder: View {
    let title: String
    let systemImage: String

    var body: some View {
        Label(title, systemImage: systemImage)
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, minHeight: 72)
            .padding(.horizontal)
    }
}
