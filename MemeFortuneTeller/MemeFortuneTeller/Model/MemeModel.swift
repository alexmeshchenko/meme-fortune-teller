//
//  MemeModel.swift
//  MemeFortuneTeller
//
//  Created by Aleksandr Meshchenko on 14.07.25.
//


import Foundation

struct MemeResponse: Codable {
    let success: Bool
    let data: MemeData
}

struct MemeData: Codable {
    let memes: [Meme]
}

struct Meme: Codable, Identifiable {
    let id: String
    let name: String
    let url: String
    let width: Int
    let height: Int
    let boxCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id, name, url, width, height
        case boxCount = "box_count"
    }
}
