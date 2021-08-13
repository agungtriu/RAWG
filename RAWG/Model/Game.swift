//
//  Game.swift
//  RAWG
//
//  Created by Agung Tri Utomo on 12/08/21.
//

struct Game: Codable, Identifiable {
    var id: Int
    var name: String
    var released: String
    var backgroundImage: String
    var metacritic: Int
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case released
        case backgroundImage = "background_image"
        case metacritic
    }
}
