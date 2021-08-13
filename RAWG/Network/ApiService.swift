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
        loadGameDataById(gameId: gameId, completion)
    }
    func fetchGame(completion: @escaping ([Game]?) -> Void) {
        loadGameData(completion)
    }
    private func loadGameData(_ completion: @escaping ([Game]?) -> Void) {
        guard let url = URL(string: "\(baseUrl)games?key=\(apiKey)") else {return}
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else {
                completion(nil)
                return
            }
            guard let games = try? JSONDecoder().decode(Games.self, from: data) else {
                completion(nil)
                return
            }
            DispatchQueue.main.async {
                completion(games.results)
            }
        }.resume()
    }
    private func loadGameDataById(gameId: String, _ completion: @escaping (GameDetail?) -> Void) {
        guard let url = URL(string: "\(baseUrl)games/\(gameId)?key=\(apiKey)") else {return}
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else {
                completion(nil)
                return
            }
            guard let games = try? JSONDecoder().decode(GameDetail.self, from: data) else {
                completion(nil)
                return
            }
            DispatchQueue.main.async {
                completion(games)
            }
        }.resume()
    }
}
