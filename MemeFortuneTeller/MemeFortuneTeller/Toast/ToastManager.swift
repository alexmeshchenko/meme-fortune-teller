//
//  ToastManager.swift
//  MemeFortuneTeller
//
//  Created by Aleksandr Meshchenko on 20.07.25.
//

import SwiftUI
import Observation

@Observable
class ToastManager {
    var isShowing: Bool = false
    var message: String = ""
    
    func show(_ message: String) {
        self.message = message
        withAnimation {
            isShowing = true
        }
        
        Task { @MainActor in
            try? await Task.sleep(for: .seconds(3))
            withAnimation {
                isShowing = false
            }
        }
    }

    func hide() {
        withAnimation {
            isShowing = false
        }
    }
}
