//
//  ModalContainerVariantView.swift
//  SwiftUI boilerplate
//
//  Created by Eric Yuan on 02/05/2026.
//

import AtomicSwiftUISDK
import SwiftUI

struct ModalContainerVariantView: View {
    @State private var isPresentingSubview = false
    @State private var isAttachedToSubview = true

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Modal container")
                    .font(.title)

                ModalPlaceholder(title: "Top content", systemImage: "star")

                Toggle("Only triggered on the subview.", isOn: $isAttachedToSubview)
                    .padding(.horizontal)

                Text("The modal container appears once cards are present in the stream container. \nTurn the above option off to trigger it on this page.")
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                if isAttachedToSubview {
                    enterSubviewButton
                } else {
                    if canDisplayAtomicContainerExamples {
                        enterSubviewButton
                            .modalContainer(containerId: AtomicSettings.containerId)
                    } else {
                        AtomicSettingsRequiredView()
                        enterSubviewButton
                    }
                }

                VStack(spacing: 12) {
                    ForEach(0..<6, id: \.self) { index in
                        ModalPlaceholder(title: "Page content \(index + 1)", systemImage: "rectangle")
                    }
                }
            }
            .padding(.vertical)
        }
        .navigationTitle("Fullscreen modal")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(isPresented: $isPresentingSubview) {
            ModalContainerSubview(isModalEnabled: isAttachedToSubview)
                .navigationTitle("Subview")
                .navigationBarTitleDisplayMode(.inline)
        }
    }

    private var enterSubviewButton: some View {
        Button {
            isPresentingSubview = true
        } label: {
            Text("Enter subview")
        }
        .padding(.horizontal)
    }
}

private struct ModalContainerSubview: View {
    let isModalEnabled: Bool

    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "star")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
                .foregroundStyle(.blue)

            if isModalEnabled {
                if canDisplayAtomicContainerExamples {
                    Text("Subview")
                        .font(.title)
                        .modalContainer(containerId: AtomicSettings.containerId)
                } else {
                    Text("Subview")
                        .font(.title)
                    AtomicSettingsRequiredView()
                }
            } else {
                Text("Subview")
                    .font(.title)
            }

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
}

private struct ModalPlaceholder: View {
    let title: String
    let systemImage: String

    var body: some View {
        Label(title, systemImage: systemImage)
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, minHeight: 72)
            .padding(.horizontal)
    }
}
