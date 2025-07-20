//
//  MainViewModel.swift
//  MemeFortuneTeller
//
//  Created by Aleksandr Meshchenko on 14.07.25.
//


import Foundation
import SwiftUI
import Observation

@Observable
class MainViewModel {
    var userQuestion: String = ""
    var currentMeme: Meme?
    var isLoading: Bool = false
    var showMeme: Bool = false
    
    var toastManager: ToastManager
    var reactionManager: ReactionManager
    var shouldFocusTextField: Bool = false
    
    private let memeService: MemeService
    
    init(
        toastManager: ToastManager = ToastManager(),
        reactionManager: ReactionManager = ReactionManager(),
        memeService: MemeService = MemeService()
    ) {
        self.toastManager = toastManager
        self.reactionManager = reactionManager
        self.memeService = memeService
    }
    
    func getPrediction() {
        guard !userQuestion.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            toastManager.show("Пожалуйста, введите ваш вопрос")
            return
        }
        
        isLoading = true
        showMeme = false
        
        Task { @MainActor in
            do {
                let memeData = try await memeService.fetchMemes()
                let randomMeme = memeData.memes.randomElement() ?? memeData.memes[0]
                self.currentMeme = randomMeme
                self.showMeme = true
            } catch {
                toastManager.show("Ошибка: \(error.localizedDescription)")

            }
            self.isLoading = false
        }
    }
    
    func getNewMeme() {
        getPrediction()
    }
    
    func acceptPrediction() {
        // Для продвинутого задания - сохраняем в SwiftData
        // saveFortune()
        
        // Показываем успех и сбрасываем
        reactionManager.showReaction("👍") {
            self.resetState()
        }
    }
    func rejectPrediction() {
        // Загружаем новый мем для того же вопроса
        reactionManager.showReaction("👎") {
            self.getPrediction()
        }
    }
    
    private func resetState() {
        userQuestion = ""
        currentMeme = nil
        showMeme = false        
        shouldFocusTextField = true
    }
    
//    private func showReactionAnimation(_ emoji: String, completion: @escaping () -> Void) {
//        reactionEmoji = emoji
//        withAnimation(.easeInOut(duration: 0.3)) {
//            showReaction = true
//        }
//        
//        Task {
//            try? await Task.sleep(for: .milliseconds(800))
//            withAnimation(.easeOut(duration: 0.3)) {
//                showReaction = false
//            }
//            try? await Task.sleep(for: .milliseconds(300))
//            completion()
//        }
//    }
}
