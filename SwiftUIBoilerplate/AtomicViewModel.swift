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
        AACSession.enableDebugMode(3)
        print("setting up atomic")
        config.setCustomValue("test", for: ContainerConfiguration.CustomString.cardListTitle)
    }
}
