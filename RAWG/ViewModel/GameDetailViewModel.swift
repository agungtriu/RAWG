//
//  GameDetailViewModel.swift
//  RAWG
//
//  Created by Agung Tri Utomo on 12/08/21.
//

import Combine

class GameDetailViewModel: ObservableObject {
    @Published var gameDetail = GameDetail(id: 0, name: "", released: "", backgroundImage: "",
                                           metacritic: 0, description: "",
                                           developers: [], publishers: [], genres: [], website: "")
    @Published var loading: Bool = false
    let service: ServiceProtocol
    init(service: ServiceProtocol = ApiService()) {
        self.service = service
    }
    func loadGameDataById(gameId: String) {
        self.loading = true
        service.fetchGameById(gameId: gameId) { gameDetail in
            self.loading = false
            guard let gameDetail = gameDetail else {
                return
            }
            self.gameDetail = gameDetail
        }
    }
}
