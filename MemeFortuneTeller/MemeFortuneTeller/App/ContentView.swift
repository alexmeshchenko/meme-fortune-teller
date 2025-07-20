//
//  ContentView.swift
//  MemeFortuneTeller
//
//  Created by Aleksandr Meshchenko on 14.07.25.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = MainViewModel()
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                // Поле ввода вопроса
                TextField("введите ваш запрос", text: $viewModel.userQuestion)
                    .textFieldStyle(SearchTextFieldStyle(text: $viewModel.userQuestion))
                    .padding(.horizontal)
                    .focused($isTextFieldFocused)
                
                // Кнопка получить предсказание
                Button("ПОЛУЧИТЬ ПРЕДСКАЗАНИЕ") {
                    isTextFieldFocused = false  // Скрываем клавиатуру
                    viewModel.getPrediction()
                }
                .buttonStyle(PurpleButtonStyle())
                .disabled(viewModel.isLoading)
                
                // Область для мема
                memeSection
                
                Spacer()
            }
            .padding()
            .onTapGesture {
                // Скрываем клавиатуру при тапе в пустую область
                isTextFieldFocused = false
            }
            .onAppear {
                isTextFieldFocused = true
            }
            .onChange(of: viewModel.shouldFocusTextField) { _, newValue in
                if newValue {
                    isTextFieldFocused = true
                    viewModel.shouldFocusTextField = false
                }
            }
            
            // Toast overlay - используем toastManager из viewModel
            ToastView(message: viewModel.toastManager.message,
                      isShowing: $viewModel.toastManager.isShowing)
        }
    }
    
    @ViewBuilder
    private var memeSection: some View {
        if viewModel.isLoading {
            ProgressView("Загружаем предсказание...")
                .frame(height: 300)
        } else if viewModel.showMeme, let meme = viewModel.currentMeme {
            VStack(spacing: 16) {
                
                // Изображение мема с наложением реакции
                ZStack {
                    AsyncImage(url: URL(string: meme.url)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .overlay(ProgressView())
                    }
                    .frame(maxHeight: 300)
                    .cornerRadius(12)
                    
                    // Анимированная реакция поверх
                    if viewModel.showReaction {
                        Text(viewModel.reactionEmoji)
                            .font(.system(size: 120))
                            .scaleEffect(viewModel.showReaction ? 1.0 : 0.5)
                            .opacity(viewModel.showReaction ? 1.0 : 0.0)
                            .animation(.spring(response: 0.6, dampingFraction: 0.8), value: viewModel.showReaction)
                    }
                }
                
                // Кнопки действий
                HStack {
                    Button("👎") {
                        viewModel.rejectPrediction()
                    }
                    .buttonStyle(RejectButtonStyle())
                    .disabled(viewModel.showReaction) // Блокируем во время анимации
                    
                    Button("👍") {
                        viewModel.acceptPrediction()
                    }
                    .buttonStyle(AcceptButtonStyle())
                    .disabled(viewModel.showReaction) // Блокируем во время анимации
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ContentView()
}
