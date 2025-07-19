//
//  Fortune.swift
//  MemeFortuneTeller
//
//  Created by Aleksandr Meshchenko on 19.07.25.
//


import SwiftData
import Foundation

@Model
class Fortune {
    var id: UUID
    var question: String
    var memeURL: String
    var memeName: String
    var timestamp: Date
    var isAccepted: Bool // true если пользователь нажал 👍
    
    init(question: String, memeURL: String, memeName: String) {
        self.id = UUID()
        self.question = question
        self.memeURL = memeURL
        self.memeName = memeName
        self.timestamp = Date()
        self.isAccepted = true // сохраняем только принятые
    }
}