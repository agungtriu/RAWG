//
//  Games.swift
//  RAWG
//
//  Created by Agung Tri Utomo on 11/08/21.
//

struct Games: Codable {
    var count: Int
    var next: String
    var results: [Game]
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case results
    }
}
