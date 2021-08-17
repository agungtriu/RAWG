//
//  DeleteFavoriteViewModel.swift
//  RAWG
//
//  Created by Agung Tri Utomo on 15/08/21.
//

import Foundation

class DeleteFavoriteViewModel: ObservableObject {
    private lazy var favoriteProvider: FavoriteProvider = { return FavoriteProvider() }()
    func deleteFavorites(id: Int) -> Bool {
        do {
            try favoriteProvider.deleteFavorite(id)
            return true
        } catch {
            print(error.localizedDescription)
        }
    return false
    }
}
