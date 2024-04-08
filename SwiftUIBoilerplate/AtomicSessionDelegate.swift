//
//  AtomicSessionDelegate.swift
//  SwiftUIBoilerplate
//
//  Created by James Sugrue on 20/03/24.
//

import Foundation
import AtomicSDK

class AtomicSessionDelegate: NSObject, AACSessionDelegate {
    func cardSessionDidRequestAuthenticationToken(handler: @escaping AACSessionAuthenticationTokenHandler) {
        // Get the authentication token (JWT) and call the handler.
        let token = "" // you will need a valid JWT generated using the key supplied to the workbench. Hard coded is ok here, or call out to a service.
        handler(token)
    }
}
