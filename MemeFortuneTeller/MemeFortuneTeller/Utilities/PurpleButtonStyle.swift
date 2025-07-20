//
//  PurpleButtonStyle.swift
//  MemeFortuneTeller
//
//  Created by Aleksandr Meshchenko on 19.07.25.
//

import SwiftUI

// Основная фиолетовая кнопка
struct PurpleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(.purple, in: RoundedRectangle(cornerRadius: 12))
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

// Кнопка "Принять" (зеленая)
struct AcceptButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.largeTitle)
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(.green.opacity(0.2), in: RoundedRectangle(cornerRadius: 12))
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

// Кнопка "Отклонить" (красная)
struct RejectButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.largeTitle)
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(.red.opacity(0.2), in: RoundedRectangle(cornerRadius: 12))
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}
