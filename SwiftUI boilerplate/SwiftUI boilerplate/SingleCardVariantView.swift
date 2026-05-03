//
//  SingleCardVariantView.swift
//  SwiftUI boilerplate
//
//  Created by Eric Yuan on 02/05/2026.
//

import AtomicSwiftUISDK
import SwiftUI

struct SingleCardVariantView: View {
    @State private var isPresentingSheet = false

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                SingleCardPlaceholder(title: "Top content", systemImage: "photo")

                NavigationLink {
                    SingleCardSecondaryView()
                        .navigationTitle("Secondary page")
                        .navigationBarTitleDisplayMode(.inline)
                } label: {
                    Label("To the secondary page", systemImage: "chevron.right")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()

                singleCardContainer

                VStack(spacing: 15) {
                    ForEach(0..<6, id: \.self) { index in
                        SingleCardPlaceholder(title: "Page content \(index + 1)", systemImage: "rectangle")
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
                .accessibilityLabel("Open single card sheet")
            }
        }
        .sheet(isPresented: $isPresentingSheet) {
            SingleCardSecondaryView()
        }
    }
}

private struct SingleCardSecondaryView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                SingleCardPlaceholder(title: "Secondary top content", systemImage: "photo")
                singleCardContainer

                VStack(spacing: 0) {
                    ForEach(0..<15, id: \.self) { index in
                        SingleCardPlaceholder(title: "Secondary content \(index + 1)", systemImage: "rectangle")
                    }
                }
                .padding(.top, 10)
            }
        }
    }

    @ViewBuilder private var singleCardContainer: some View {
        if canDisplayAtomicContainerExamples {
            SingleCardContainer(containerId: AtomicSettings.containerId)
        } else {
            AtomicSettingsRequiredView()
        }
    }
}

@ViewBuilder private var singleCardContainer: some View {
    if canDisplayAtomicContainerExamples {
        SingleCardContainer(containerId: AtomicSettings.containerId)
    } else {
        AtomicSettingsRequiredView()
    }
}

private struct SingleCardPlaceholder: View {
    let title: String
    let systemImage: String

    var body: some View {
        Label(title, systemImage: systemImage)
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, minHeight: 72)
            .padding(.horizontal)
    }
}
