//
//  GameDetail.swift
//  RAWG
//
//  Created by Agung Tri Utomo on 11/08/21.
//

struct GameDetail: Decodable, Identifiable {
    var id: Int
    var name: String
    var released: String
    var backgroundImage: String
    var metacritic: Int
    var description: String
    var developers: String
    var publishers: String
    var genres: String
    var website: String
}
