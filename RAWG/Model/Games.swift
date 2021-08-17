//
//  Games.swift
//  RAWG
//
//  Created by Agung Tri Utomo on 11/08/21.
//

struct Games: Decodable {
    var count: Int
    var next: String
    var results: [Game]
}
