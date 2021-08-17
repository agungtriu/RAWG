//
//  Game.swift
//  RAWG
//
//  Created by Agung Tri Utomo on 12/08/21.
//

struct Game: Decodable, Identifiable {
    let id: Int
    let name: String
    let released: String
    let backgroundImage: String
    let metacritic: Int
}
