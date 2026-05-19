//
//  ContentView.swift
//  SwiftUI boilerplate
//
//  Created by Eric Yuan on 02/05/2026.
//

import SwiftUI
import AtomicSwiftUISDK

struct ContentView: View {
    
    var config: ContainerConfiguration {
        var cfg = ContainerConfiguration()
        cfg.enabledUIElements.remove(.cardListHeader)
        // Setting it to .top enables the non-opaque scrolling effect. See its documentation for more details.
        cfg.ignoresSafeAreaEdges = [.top]
        return cfg
    }
    
    var body: some View {
        NavigationStack {
            NavigationLink {
                StreamContainer(containerId: AtomicSettings.containerId, configuration: config)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Text("Notifications").font(.headline)
                        }
                    }
                }
            } label: {
                Image(systemName: "list.dash.header.rectangle")
                Text("Stream container")
            }
        }
    }
}
