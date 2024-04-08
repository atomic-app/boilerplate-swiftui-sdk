//
//  AtomicViewModel.swift
//  SwiftUIBoilerplate
//
//  Created by James Sugrue on 20/03/24.
//

import Foundation
import AtomicSDK
import AtomicSwiftUISDK

class AtomicViewModel : ObservableObject {
    var config = ContainerConfiguration()
    
    init() {
        setupAtomic()
        config.setCustomValue("test", for: ContainerConfiguration.CustomString.cardListTitle)
    }
    
    func setupAtomic() {
        
        AACSession.setSessionDelegate(AtomicSessionDelegate())
        AACSession.enableDebugMode(3)
        print("setting up atomic")
        if let url = URL(string: AtomicConfiguration.apiHost) {
            AACSession.setApiBaseUrl(url)
        }

    }
}
