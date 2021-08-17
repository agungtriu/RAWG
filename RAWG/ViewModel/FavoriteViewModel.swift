//
//  FavoriteViewModel.swift
//  RAWG
//
//  Created by Agung Tri Utomo on 16/08/21.
//

import Foundation

class FavoriteViewModel: ObservableObject {
    @Published var favorite: FavoriteModel = FavoriteModel(
                                                id: 0,
                                                name: "",
                                                release: "",
                                                backgroundImage: "",
                                                metacritic: 0,
                                                description: "",
                                                developers: "",
                                                publishers: "",
                                                genres: "",
                                                website: ""
                                            )
    private lazy var favoriteProvider: FavoriteProvider = { return FavoriteProvider() }()
    func getFavorite(id: Int) {
        favoriteProvider.getFavorite(id) { result in
            DispatchQueue.main.async {
                self.favorite = result
            }
        }
    }
}
