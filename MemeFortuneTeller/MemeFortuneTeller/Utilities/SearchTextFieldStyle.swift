//
//  SearchTextFieldStyle.swift
//  MemeFortuneTeller
//
//  Created by Aleksandr Meshchenko on 19.07.25.
//

import SwiftUI

struct SearchTextFieldStyle: TextFieldStyle {
    @Binding var text: String
    
    // swiftlint:disable:next identifier_name
    func _body(configuration: TextField<Self._Label>) -> some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.secondary)
                .padding(.leading, 12)
            
            configuration
                .padding(.vertical, 12)
            
            // Кнопка очистки с анимацией
            Button {
                text = ""
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .foregroundStyle(.secondary)
                    .opacity(text.isEmpty ? 0 : 1)
            }
            .padding(.trailing, 12)
            .animation(.easeInOut(duration: 0.2), value: text.isEmpty)
        }
        .background(.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 10))
    }
}
