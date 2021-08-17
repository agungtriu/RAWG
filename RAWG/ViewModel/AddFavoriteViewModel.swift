//
//  AddFavoriteViewModel.swift
//  RAWG
//
//  Created by Agung Tri Utomo on 15/08/21.
//

import Foundation

class AddFavoriteViewModel: ObservableObject {
    private lazy var favoriteProvider: FavoriteProvider = { return FavoriteProvider() }()
    func addFavorite(favorite: FavoriteModel) -> Bool {
        do {
            try favoriteProvider.addFavorite(favorite)
            return true
        } catch {
            print(error.localizedDescription)
        }
        return false
    }
}
