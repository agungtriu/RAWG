//
//  FavoritesList.swift
//  RAWG
//
//  Created by Agung Tri Utomo on 15/08/21.
//

import SwiftUI

struct FavoritesList: View {
    @ObservedObject var favoritesViewModel =  FavoritesViewModel()
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
            ZStack {
                Color.black.ignoresSafeArea()
                if favoritesViewModel.loading {
                    LoadingIndicator(color: Color.blue, size: 50)
                } else {
                    if favoritesViewModel.favorites.isEmpty {
                        NoDataView()
                    } else {
                        ScrollView {
                            LazyVGrid(columns: columns, spacing: 90) {
                                ForEach(favoritesViewModel.favorites, id: \.id) { data in
                                    NavigationLink(destination: FavoriteDetailView(favorite: data)) {
                                        FavoriteRow(favorite: data)
                                    }
                                }
                            }.padding(EdgeInsets(top: 48, leading: 16, bottom: 16, trailing: 16))
                        }
                    }
                }
            }.onAppear {
                self.favoritesViewModel.loadFavorites()
            }
    }
}

struct FavoritesList_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesList()
    }
}
