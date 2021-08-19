//
//  GameDetailView.swift
//  RAWG
//
//  Created by Agung Tri Utomo on 11/08/21.
//

import SwiftUI
import URLImage

struct GameDetailView: View {
    @State var isSaved = false
    var gameId: Int
    var backgroundImage: String
    @ObservedObject var gameDetailViewModel = GameDetailViewModel()
    @ObservedObject var addFavoriteViewModel = AddFavoriteViewModel()
    @ObservedObject var deleteFavoriteViewModel = DeleteFavoriteViewModel()
    @ObservedObject var favoriteViewModel: FavoriteViewModel
    init(gameId: Int, backgroundImage: String) {
        self.gameId = gameId
        self.backgroundImage = backgroundImage
        self.favoriteViewModel = FavoriteViewModel(id: self.gameId)
    }
    var genre: some View {
        Group {
            Text("Genre")
                .font(Font.custom("Mulish-Bold", size: 17))
                .foregroundColor(Color(hex: 0xA8A8A8))
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 4, trailing: 16 ))
            Text(gameDetailViewModel.gameDetail.genres)
                .font(Font.custom("Mulish-Regular", size: 15))
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16 ))
        }
    }
    var about: some View {
        Group {
            Text("About")
                .font(Font.custom("Mulish-Bold", size: 17))
                .foregroundColor(Color(hex: 0xA8A8A8))
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 4, trailing: 16 ))
            Text(gameDetailViewModel.gameDetail.description)
                .fixedSize(horizontal: false, vertical: true)
                .font(Font.custom("Mulish-Regular", size: 15))
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16 ))
        }
    }
    var developers: some View {
        Group {
            Text("Developers")
                .font(Font.custom("Mulish-Bold", size: 17))
                .foregroundColor(Color(hex: 0xA8A8A8))
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 4, trailing: 16 ))
            Text(gameDetailViewModel.gameDetail.developers)
                .font(Font.custom("Mulish-Regular", size: 15))
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16 ))
        }
    }
    var publishers: some View {
        Group {
            Text("Publishers")
                .font(Font.custom("Mulish-Bold", size: 17))
                .foregroundColor(Color(hex: 0xA8A8A8))
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 4, trailing: 16 ))
            Text(gameDetailViewModel.gameDetail.publishers)
                .font(Font.custom("Mulish-Regular", size: 15))
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16 ))
        }
    }
    var website: some View {
        Group {
            Text("Website")
                .font(Font.custom("Mulish-Bold", size: 17))
                .foregroundColor(Color(hex: 0xA8A8A8))
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 4, trailing: 16 ))
            Text("\(gameDetailViewModel.gameDetail.website)")
                .fixedSize(horizontal: false, vertical: true)
                .font(Font.custom("Mulish-Regular", size: 15))
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16 ))
        }
    }
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            if gameDetailViewModel.loading {
                VStack(alignment: .center) {
                    LoadingIndicator(color: Color.blue, size: 50)
                }
            } else {
                if gameDetailViewModel.gameDetail.name.isEmpty {
                    NoDataView()
                } else {
                    ScrollView {
                        URLImage(URL(string: "\(backgroundImage)")!) {proxy in
                                proxy.resizable()
                                    .aspectRatio(contentMode: .fit)}
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0 ))
                            VStack {
                                Text("\(gameDetailViewModel.gameDetail.name)")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .font(Font.custom("Mulish-Regular", size: 17))
                                    .foregroundColor(.white)
                                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16 ))
                            VStack(alignment: .leading, spacing: nil, content: {
                                HStack {
                                    VStack(alignment: .leading, spacing: 0, content: {
                                        Text("Release Date")
                                            .font(Font.custom("Mulish-Bold", size: 17))
                                            .foregroundColor(Color(hex: 0xA8A8A8))
                                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0 ))
                                        Text(convertDateFormat(inputDate: gameDetailViewModel.gameDetail.released))
                                            .font(Font.custom("Mulish-Regular", size: 15))
                                            .foregroundColor(.white)
                                    })
                                    Spacer()
                                    VStack {
                                        Text("Metacritic")
                                            .font(Font.custom("Mulish-Bold", size: 17))
                                            .foregroundColor(Color(hex: 0xA8A8A8))
                                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0 ))
                                        Text("\(gameDetailViewModel.gameDetail.metacritic)")
                                            .font(Font.custom("Mulish-Regular", size: 15))
                                            .foregroundColor(.yellow)
                                            .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4 ))
                                            .overlay(RoundedRectangle(cornerRadius: 5)
                                                        .stroke(Color.yellow, lineWidth: 1))
                                    }
                                }.padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16 ))
                                genre
                                about
                                developers
                                publishers
                                website
                            })
                        }
                    }
                    .navigationBarItems(
                        trailing:
                            self.isSaved ?
                            Button(action: {
                                self.isSaved = !self.deleteFavoriteViewModel.deleteFavorites(id: self.gameId)
                            }, label: {
                                Image("icon_favorite_solid").imageScale(.large)
                            })
                            :
                            Button(action: {
                                let favorite: FavoriteModel = FavoriteModel(
                                    id: Int32(self.gameDetailViewModel.gameDetail.id),
                                    name: gameDetailViewModel.gameDetail.name,
                                    release: gameDetailViewModel.gameDetail.released,
                                    backgroundImage: gameDetailViewModel.gameDetail.backgroundImage,
                                    metacritic: Int32(gameDetailViewModel.gameDetail.metacritic),
                                    description: gameDetailViewModel.gameDetail.description,
                                    developers: gameDetailViewModel.gameDetail.developers,
                                    publishers: gameDetailViewModel.gameDetail.publishers,
                                    genres: gameDetailViewModel.gameDetail.genres,
                                    website: gameDetailViewModel.gameDetail.website
                                )
                                self.isSaved = self.addFavoriteViewModel.addFavorite(favorite: favorite)
                            }, label: {
                                Image("icon_favorite").imageScale(.large)
                            })
                    )
                }
            }
        }
        .onAppear {
            self.gameDetailViewModel.loadGameDataById(gameId: String(self.gameId))
            isSaved = self.favoriteViewModel.isStored
        }
        .onDisappear {
            self.favoriteViewModel.getFavorite(id: self.gameId)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle(Text("RAWG"))
    }
}
