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
                .foregroundColor(.gray)
                .padding(.leading, 12)
            
            configuration
                .padding(.vertical, 12)
            
            // Кнопка очистки
            if !text.isEmpty {
                Button {
                    text = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
                .padding(.trailing, 12)
            } else {
                // Заглушка для сохранения размера
                Spacer()
                    .frame(width: 32)
            }
        }
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}
