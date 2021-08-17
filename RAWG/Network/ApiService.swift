//
//  ApiService.swift
//  RAWG
//
//  Created by Agung Tri Utomo on 12/08/21.
//

import Foundation

private let baseUrl = "https://api.rawg.io/api/"
private let apiKey = "6d06233febf7422e9ce1ff890b3aa950"

class ApiService: ServiceProtocol {
    func fetchGameById(gameId: String, completion: @escaping (GameDetail?) -> Void) {
        guard let url = URL(string: "\(baseUrl)games/\(gameId)?key=\(apiKey)") else {return}
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else {
                completion(nil)
                return
            }
            guard let game = try? JSONDecoder().decode(GameDetailResponse.self, from: data) else {
                completion(nil)
                return
            }
            var developers: String = ""
            if game.developers != nil {
                game.developers!.forEach({(developer) in
                    if developer.name != nil {
                        developers += developer.name!+", "
                    }
                })
            }
            var publishers: String = ""
            if game.publishers != nil {
                game.publishers!.forEach({(publisher) in
                    if publisher.name != nil {
                        publishers += publisher.name!+", "
                    }
                })
            }
            var genres: String = ""
            if game.genres != nil {
                game.genres!.forEach({ (genre) in
                    if genre.name != nil {
                        genres += genre.name!+", "
                    }
                })
            }
            let gameDetail = GameDetail(
                id: game.id ?? 0,
                name: game.name ?? "",
                released: game.released ?? "",
                backgroundImage: game.backgroundImage ?? "Unavailable!",
                metacritic: game.metacritic ?? 0,
                description: game.description ?? "",
                developers: developers,
                publishers: publishers,
                genres: genres,
                website: game.website ?? ""
                )
            DispatchQueue.main.async {
                completion(gameDetail)
            }
        }.resume()
    }
    func fetchGame(completion: @escaping ([Game]?) -> Void) {
        guard let url = URL(string: "\(baseUrl)games?key=\(apiKey)") else {return}
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else {
                completion(nil)
                return
            }
            guard let game = try? JSONDecoder().decode(GamesResponse.self, from: data) else {
                completion(nil)
                return
            }
            var games: [Game] = []
            game.results?.forEach({ (result) in
                games.append(Game(
                    id: result.id ?? 0,
                    name: result.name ?? "",
                    released: result.released ?? "", backgroundImage: result.backgroundImage ?? "Unavailable!",
                    metacritic: result.metacritic ?? 0
                ))
            })
            DispatchQueue.main.async {
                completion(games)
            }
        }.resume()
    }
}
