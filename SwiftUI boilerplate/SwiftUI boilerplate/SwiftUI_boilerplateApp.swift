//
//  SwiftUI_boilerplateApp.swift
//  SwiftUI boilerplate
//
//  Created by Eric Yuan on 02/05/2026.
//

import SwiftUI
import AtomicSwiftUISDK

/// Atomic SDK settings hardcoded for the boilerplate app. To find those settings
///
/// - Open the [Atomic Workbench] (https://workbench.atomic.io/), and navigate to the Configuration area.
/// - Your environment ID is at the top of the page under 'Environment ID'.
/// - Your API key is in the 'SDK API Keys' section.
/// - Your API host is in the 'SDK API Host' section.
/// - Your container ID is in the 'Stream containers' section.
enum AtomicSettings {
    static let apiKey = ""
    static let environmentId = ""
    static let apiBaseUrl = ""
    static let containerId = ""
}

@main
struct SwiftUI_boilerplateApp: App {
    
    init() {
        AACSession.login(withEnvironmentId: AtomicSettings.environmentId, apiKey: AtomicSettings.apiKey, sessionDelegate: Delegate(), apiBaseUrl: URL(string: AtomicSettings.apiBaseUrl))
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct Delegate: AACSessionDelegate {
    func cardSessionDidRequestAuthenticationToken() async -> String? {
        // Return the authentication token (JWT).
        ""
    }
}
