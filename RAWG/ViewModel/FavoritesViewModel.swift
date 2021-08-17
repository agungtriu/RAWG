//
//  LoadFavoritesViewModel.swift
//  RAWG
//
//  Created by Agung Tri Utomo on 15/08/21.
//

import Foundation

class FavoritesViewModel: ObservableObject {
    @Published var favorites: [FavoriteModel] = []
    @Published var loading: Bool = false
    private lazy var favoriteProvider: FavoriteProvider = { return FavoriteProvider() }()
    init() {
        loadFavorites()
    }
    func loadFavorites() {
        self.loading = true
        favoriteProvider.getAllFavoriteGame { result in
            DispatchQueue.main.async {
                self.loading = false
                self.favorites = result
            }
        }
    }
}
