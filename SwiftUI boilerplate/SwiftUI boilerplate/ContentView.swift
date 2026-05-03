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
        var cfg = ContainerConfiguration(onEvent: nil) { cardsToResolve in
            let resolvedCards = cardsToResolve.map{ card in
                var newCard = card
                newCard.resolveRuntimeVariable(name: "amount", value: "500")
                return newCard
            }
            return resolvedCards
        }
        cfg.ignoresSafeAreaEdges = .bottom
        return cfg
    }
    
    var body: some View {
        StreamContainer(containerId: AtomicSettings.containerId, configuration: config)
    }
}
