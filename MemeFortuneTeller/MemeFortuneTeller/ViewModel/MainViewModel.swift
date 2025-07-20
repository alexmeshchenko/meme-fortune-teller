//
//  MainViewModel.swift
//  MemeFortuneTeller
//
//  Created by Aleksandr Meshchenko on 14.07.25.
//


import Foundation
import SwiftUI  // Добавляем для withAnimation
import Observation

@Observable
class MainViewModel {
    var userQuestion: String = ""
    var currentMeme: Meme?
    var isLoading: Bool = false
    var showMeme: Bool = false
    
    // анимации всплывающих error-сообщений
    var showToast: Bool = false
    var toastMessage: String = ""
    
    // анимации реакций
    var showReaction: Bool = false
    var reactionEmoji: String = ""
    
    var shouldFocusTextField: Bool = false
    
    private let memeService = MemeService()
    
    func getPrediction() {
        guard !userQuestion.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            showErrorToast("Пожалуйста, введите ваш вопрос")
            return
        }
        
        isLoading = true
        showMeme = false
        showToast = false
        
        Task { @MainActor in
            do {
                let memeData = try await memeService.fetchMemes()
                let randomMeme = memeData.memes.randomElement() ?? memeData.memes[0]
                self.currentMeme = randomMeme
                self.showMeme = true
            } catch {
                showErrorToast("Ошибка: \(error.localizedDescription)")
            }
            self.isLoading = false
        }
    }
    
    private func showErrorToast(_ message: String) {
        toastMessage = message
        withAnimation(.easeInOut(duration: 0.3)) {
            showToast = true
        }
    }
    
    func getNewMeme() {
        getPrediction()
    }
    
    func acceptPrediction() {
        // Для продвинутого задания - сохраняем в SwiftData
        // saveFortune()
        
        // Показываем успех и сбрасываем
        //showSuccessMessage()
        showReactionAnimation("👍") {
            self.resetState()
        }
    }
    func rejectPrediction() {
        // Загружаем новый мем для того же вопроса
        showReactionAnimation("👎") {
            self.getPrediction()
        }
    }
    
    private func resetState() {
        userQuestion = ""
        currentMeme = nil
        showMeme = false
        
        showToast = false
        toastMessage = ""
        
        shouldFocusTextField = true
    }
    
    private func showReactionAnimation(_ emoji: String, completion: @escaping () -> Void) {
        reactionEmoji = emoji
        withAnimation(.easeInOut(duration: 0.3)) {
            showReaction = true
        }
        
        Task {
            try? await Task.sleep(for: .milliseconds(800))
            withAnimation(.easeOut(duration: 0.3)) {
                showReaction = false
            }
            try? await Task.sleep(for: .milliseconds(300))
            completion()
        }
    }
}
