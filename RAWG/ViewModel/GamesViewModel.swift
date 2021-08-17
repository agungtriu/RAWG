//
//  GamesViewModel.swift
//  RAWG
//
//  Created by Agung Tri Utomo on 12/08/21.
//

import Foundation

class GamesViewModel: ObservableObject {
    @Published var games =  Games(count: 0, next: "", results: [])
    @Published var loading = false
    let service: ServiceProtocol
    init(service: ServiceProtocol = ApiService()) {
        self.service = service
    }
    func loadGameData() {
        self.loading = true
        service.fetchGame { games in
            guard let games = games else {
                return
            }
            DispatchQueue.main.async {
                self.loading = false
                self.games.results = games
            }
        }
    }
}
