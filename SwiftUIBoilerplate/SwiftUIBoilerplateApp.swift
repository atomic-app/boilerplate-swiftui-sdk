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
        
        AACSession.login(withEnvironmentId: AtomicConfiguration.environmentId,
                         apiKey: AtomicConfiguration.apiKey,
                         sessionDelegate: AtomicSessionDelegate(),
                         apiBaseUrl: URL(string: AtomicConfiguration.apiHost))
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
