//
//  ReactionManager.swift
//  MemeFortuneTeller
//
//  Created by Aleksandr Meshchenko on 20.07.25.
//


import SwiftUI
import Observation

@Observable
class ReactionManager {
    var isShowing: Bool = false
    var emoji: String = ""
    
    func showReaction(_ emoji: String, completion: @escaping () -> Void) {
        self.emoji = emoji
        withAnimation(.easeInOut(duration: 0.3)) {
            isShowing = true
        }
        
        Task {
            try? await Task.sleep(for: .milliseconds(800))
            withAnimation(.easeOut(duration: 0.3)) {
                isShowing = false
            }
            try? await Task.sleep(for: .milliseconds(300))
            completion()
        }
    }
}