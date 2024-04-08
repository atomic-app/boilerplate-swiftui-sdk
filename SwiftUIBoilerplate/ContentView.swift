//
//  ContentView.swift
//  SwiftUIBoilerplate
//
//  Created by James Sugrue on 20/03/24.
//

import SwiftUI

import AtomicSwiftUISDK

struct ContentView: View {
    
    var viewModel = AtomicViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    ZStack {
                        StreamContainer(isInNavigationStack: true, containerId: AtomicConfiguration.streamContainerId, configuration: viewModel.config)
                            .frame(maxWidth: .infinity)
                            .navigationTitle("Atomic Stream")
                    }
                } label: {
                    Text("Messages")
                }
            }
            .padding()
            .navigationTitle("Atomic Boilerplate")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    ContentView()
}
