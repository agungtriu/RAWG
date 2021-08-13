//
//  GamesList.swift
//  RAWG
//
//  Created by Agung Tri Utomo on 12/08/21.
//

import SwiftUI

struct GamesList: View {
    @ObservedObject var gamesViewModel =  GamesViewModel()
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
            ZStack {
                Color.black.ignoresSafeArea()
                if gamesViewModel.loading {
                    LoadingIndicator(color: Color.blue, size: 50)
                } else {
                    if gamesViewModel.games.results.isEmpty {
                        NoDataView()
                    } else {
                        ScrollView {
                            LazyVGrid(columns: columns, spacing: 90) {
                                ForEach(gamesViewModel.games.results, id: \.id) { data in
                                    NavigationLink(destination: GameDetailView(gameId: data.id, backgroundImage: data.backgroundImage)) {
                                        GamesRow(game: data)
                                    }
                                }
                            }.padding(EdgeInsets(top: 48, leading: 16, bottom: 16, trailing: 16))
                        }
                    }
                }
            }.onAppear {
                if self.gamesViewModel.games.results.isEmpty {
                    self.gamesViewModel.loadGameData()
                }
            }
            .navigationBarTitle("RAWG")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: NavigationLink(destination: AboutMe()) {
                Image(systemName: "person.crop.circle").imageScale(.large)
            })
    }
}

struct GamesList_Previews: PreviewProvider {
    static var previews: some View {
        GamesList()
    }
}
