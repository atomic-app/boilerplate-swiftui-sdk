//
//  ContentView.swift
//  SwiftUI boilerplate
//
//  Created by Eric Yuan on 02/05/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(ContainerVariant.allCases) { variant in
                        NavigationLink {
                            variant.destination
                        } label: {
                            Label {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(variant.title)
                                    Text(variant.description)
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)
                                        .multilineTextAlignment(.leading)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            } icon: {
                                Image(systemName: variant.systemImage)
                            }
                        }
                        .buttonStyle(.plain)

                        Divider()
                    }
                }
                .padding()
            }
            .navigationTitle("Container variants")
        }
    }
}

private enum ContainerVariant: String, CaseIterable, Identifiable {
    case stream
    case singleCard
    case horizontal
    case modal

    var id: Self { self }

    var title: String {
        switch self {
        case .stream: "Stream container"
        case .singleCard: "Single card view"
        case .horizontal: "Horizontal container"
        case .modal: "Fullscreen modal"
        }
    }

    var description: String {
        switch self {
        case .stream: "Navigation and a bell-triggered sheet."
        case .singleCard: "A scroll page with a secondary route and sheet."
        case .horizontal: "A horizontal card row in the same host layout."
        case .modal: "A blocking modal container attached to page content."
        }
    }

    var systemImage: String {
        switch self {
        case .stream: "list.dash.header.rectangle"
        case .singleCard: "rectangle.stack"
        case .horizontal: "rectangle.grid.1x2"
        case .modal: "rectangle.inset.filled"
        }
    }

    @ViewBuilder var destination: some View {
        switch self {
        case .stream: StreamContainerVariantView()
        case .singleCard: SingleCardVariantView()
        case .horizontal: HorizontalContainerVariantView()
        case .modal: ModalContainerVariantView()
        }
    }
}

var canDisplayAtomicContainerExamples: Bool {
    AtomicSettings.apiKey.isEmpty == false
        && AtomicSettings.environmentId.isEmpty == false
        && AtomicSettings.apiBaseUrl.isEmpty == false
        && AtomicSettings.containerId.isEmpty == false
}

struct AtomicSettingsRequiredView: View {
    var body: some View {
        VStack(spacing: 12) {
            Label {
                Text("Atomic settings required")
            } icon: {
                Image(systemName: "exclamationmark.triangle")
                    .foregroundStyle(.orange)
            }
            .font(.headline)

            Text("Set `apiKey`, `environmentId`, `apiBaseUrl`, and `containerId` in `AtomicSettings` before this container can be displayed.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, minHeight: 160)
        .padding()
    }
}
