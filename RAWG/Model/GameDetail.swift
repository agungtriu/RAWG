//
//  Game.swift
//  RAWG
//
//  Created by Agung Tri Utomo on 11/08/21.
//

struct GameDetail: Codable, Identifiable {
    var id: Int
    var name: String
    var released: String
    var backgroundImage: String
    var metacritic: Int
    var description: String
    var developers: [Developer]
    var publishers: [Publisher]
    var genres: [Genre]
    var website: String
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case released
        case backgroundImage = "background_image"
        case metacritic
        case description = "description_raw"
        case developers
        case publishers
        case genres
        case website
    }
}
