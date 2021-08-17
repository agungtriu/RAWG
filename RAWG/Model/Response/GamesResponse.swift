//
//  Games.swift
//  RAWG
//
//  Created by Agung Tri Utomo on 11/08/21.
//

struct GamesResponse: Codable {
    var count: Int
    var next: String
    var results: [GameResponse]?
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case results
    }
    struct GameResponse: Codable {
        var id: Int?
        var name: String?
        var released: String?
        var backgroundImage: String?
        var metacritic: Int?
        enum CodingKeys: String, CodingKey {
            case id
            case name
            case released
            case backgroundImage = "background_image"
            case metacritic
        }
    }
}
