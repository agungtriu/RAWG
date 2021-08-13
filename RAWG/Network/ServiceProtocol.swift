//
//  ServiceProtocol.swift
//  RAWG
//
//  Created by Agung Tri Utomo on 12/08/21.
//

protocol ServiceProtocol {
    func fetchGame(completion: @escaping ([Game]?) -> Void)
    func fetchGameById(gameId: String, completion: @escaping (GameDetail?) -> Void)
}
