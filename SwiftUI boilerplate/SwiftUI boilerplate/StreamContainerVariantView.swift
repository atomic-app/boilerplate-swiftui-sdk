//
//  StreamContainerVariantView.swift
//  SwiftUI boilerplate
//
//  Created by Eric Yuan on 02/05/2026.
//

import AtomicSwiftUISDK
import SwiftUI

struct StreamContainerVariantView: View {
    @State private var isPresentingSheet = false
    
    var body: some View {
        streamContainer
            .navigationTitle("Stream container")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isPresentingSheet = true
                    } label: {
                        Image(systemName: "bell.badge")
                    }
                    .accessibilityLabel("Open stream container sheet")
                }
            }
            .sheet(isPresented: $isPresentingSheet) {
                streamContainer
            }
    }
    
    @ViewBuilder private var streamContainer: some View {
        if canDisplayAtomicContainerExamples {
            StreamContainer(containerId: AtomicSettings.containerId)
                .navigationTitle("Notifications")
                .navigationBarTitleDisplayMode(.inline)
        } else {
            AtomicSettingsRequiredView()
        }
    }
}
