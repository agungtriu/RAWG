//
//  LoadFavoritesViewModel.swift
//  RAWG
//
//  Created by Agung Tri Utomo on 15/08/21.
//

import Foundation
class FavoritesViewModel: ObservableObject {
//    @Published
//    var favoriteGame = [FavoriteViewModel]()
//    @Published var loading : Bool = false
//    init() {
//        fetchAllFavoriteGame()
//    }
//    func fetchAllFavoriteGame() {
//        self.loading = true
//        DispatchQueue.main.async {
//            self.loading = false
//            self.favoriteGame = CoreDataManagers.shared.getAllFavoriteGame().map(FavoriteGameViewModel.init)
//        }
//    }
    private lazy var favoriteProvider: FavoriteProvider = { return FavoriteProvider() }()

        .getAllMember { result in
            DispatchQueue.main.async {
                self.members = result
                self.memberTableView.reloadData()
            }
        }
}
