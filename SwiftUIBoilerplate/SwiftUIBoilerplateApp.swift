//
//  SwiftUIBoilerplateApp.swift
//  SwiftUIBoilerplate
//
//  Created by James Sugrue on 20/03/24.
//

import SwiftUI
import AtomicSDK

@main
struct SwiftUIBoilerplateApp: App {
    
    init() {
        AACSession.initialise(withEnvironmentId: AtomicConfiguration.environmentId,
                              apiKey: AtomicConfiguration.apiKey)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
