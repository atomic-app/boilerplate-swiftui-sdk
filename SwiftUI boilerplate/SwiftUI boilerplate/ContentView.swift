//
//  ContentView.swift
//  SwiftUI boilerplate
//
//  Created by Eric Yuan on 02/05/2026.
//

import SwiftUI
import AtomicSwiftUISDK

struct ContentView: View {
    var body: some View {
        // Simplest presentation. Display a container with default configurations.
        StreamContainer(containerId: AtomicSettings.containerId)
    }
}
