//
//  Developer.swift
//  RAWG
//
//  Created by Agung Tri Utomo on 12/08/21.
//

struct Developer: Codable, Identifiable {
    var id: Int
    var name: String
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
