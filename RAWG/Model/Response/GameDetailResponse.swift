//
//  Game.swift
//  RAWG
//
//  Created by Agung Tri Utomo on 11/08/21.
//

struct GameDetailResponse: Codable {
    var id: Int?
    var name: String?
    var released: String?
    var backgroundImage: String?
    var metacritic: Int?
    var description: String?
    var developers: [DeveloperResponse]?
    var publishers: [PublisherResponse]?
    var genres: [GenreResponse]?
    var website: String?
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
    struct DeveloperResponse: Codable {
        var id: Int?
        var name: String?
        enum CodingKeys: String, CodingKey {
            case id
            case name
        }
    }
    struct PublisherResponse: Codable {
        var id: Int?
        var name: String?
        enum CodingKeys: String, CodingKey {
            case id
            case name
        }
    }
    struct GenreResponse: Codable {
        var id: Int?
        var name: String?
        enum CodingKeys: String, CodingKey {
            case id
            case name
        }
    }
}
