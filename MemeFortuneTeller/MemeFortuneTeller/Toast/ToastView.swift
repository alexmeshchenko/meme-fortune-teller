//
//  ToastView.swift
//  MemeFortuneTeller
//
//  Created by Aleksandr Meshchenko on 19.07.25.
//
import SwiftUI

struct ToastView: View {
    let message: String
    @Binding var isShowing: Bool
    
    private let topPadding: CGFloat = 50 // Отступ от верха (под статус бар)
    
    var body: some View {
        VStack {
            if isShowing {
                Text(message)
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        Color.red
                            .opacity(0.85)  // Полупрозрачность по Раскину
                    )
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.top, topPadding)
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .gesture(
                        DragGesture()
                            .onEnded { value in
                                // Свайп вверх для скрытия
                                if value.translation.height < -50 {
                                    hideToast()
                                }
                                // Свайп влево/вправо для скрытия
                                else if abs(value.translation.width) > 100 {
                                    hideToast()
                                }
                            }
                    )
                    .onTapGesture {
                        hideToast()
                    }
                    .onAppear {
                        Task {
                            try? await Task.sleep(for: .seconds(3))
                            hideToast()
                        }
                    }
            }
            
            Spacer()
        }
        .animation(.easeInOut(duration: 0.3), value: isShowing)
    }
    
    private func hideToast() {
        withAnimation(.easeOut(duration: 0.3)) {
            isShowing = false
        }
    }
}
