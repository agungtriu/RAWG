//
//  Genre.swift
//  RAWG
//
//  Created by Agung Tri Utomo on 11/08/21.
//

struct Genre: Codable, Identifiable {
    var id: Int
    var name: String
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
