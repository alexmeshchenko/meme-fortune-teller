//
//  ReactionView.swift
//  MemeFortuneTeller
//
//  Created by Aleksandr Meshchenko on 20.07.25.
//


import SwiftUI

struct ReactionView: View {
    let emoji: String
    let isShowing: Bool
    
    var body: some View {
        Text(emoji)
            .font(.system(size: 120))
            .scaleEffect(isShowing ? 1.0 : 0.5)
            .opacity(isShowing ? 1.0 : 0.0)
            .animation(.spring(response: 0.6, dampingFraction: 0.8), value: isShowing)
    }
}