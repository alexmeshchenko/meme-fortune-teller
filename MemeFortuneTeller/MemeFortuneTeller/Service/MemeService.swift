//
//  MemeService.swift
//  MemeFortuneTeller
//
//  Created by Aleksandr Meshchenko on 14.07.25.
//


import Foundation
import Observation

@Observable
class MemeService {
    private let baseURL = "https://api.imgflip.com/get_memes"
    private let enableTestDelay = true // Для тестирования UI
    
    func fetchMemes() async throws -> MemeData {
        guard let url = URL(string: baseURL) else {
            throw URLError(.badURL)
        }
        
        // Задержка только для тестирования
        if enableTestDelay {
            try await Task.sleep(for: .seconds(1))
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        /// проверяем HTTP status code
        guard let httpResponse = response as? HTTPURLResponse,
              200...299 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }
        
        /// занимается только декодированием JSON
        let memeResponse = try JSONDecoder().decode(MemeResponse.self, from: data)
        
        /// занимается бизнес-логикой валидации:
        guard !memeResponse.data.memes.isEmpty else {
            throw URLError(.badServerResponse)
        }
        
        return memeResponse.data
    }
}
