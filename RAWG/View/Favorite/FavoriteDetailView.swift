//
//  FavoriteDetailView.swift
//  RAWG
//
//  Created by Agung Tri Utomo on 16/08/21.
//

import SwiftUI
import URLImage

struct FavoriteDetailView: View {
    @State var isSaved = true
    var favorite: FavoriteModel
    @ObservedObject var deleteFavoriteViewModel = DeleteFavoriteViewModel()
    @ObservedObject var addFavoriteViewModel = AddFavoriteViewModel()
    var genre: some View {
        Group {
            Text("Genre")
                .font(Font.custom("Mulish-Bold", size: 17))
                .foregroundColor(Color(hex: 0xA8A8A8))
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 4, trailing: 16 ))
            Text((favorite.genres ?? ""))
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
            Text(favorite.description ?? "")
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
            Text((favorite.developers ?? ""))
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
            Text((favorite.publishers ?? ""))
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
            Text(favorite.website ?? "")
                .fixedSize(horizontal: false, vertical: true)
                .font(Font.custom("Mulish-Regular", size: 15))
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16 ))
        }
    }
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ScrollView {
                URLImage(URL(string: "\(favorite.backgroundImage ?? "")")!) {proxy in
                        proxy.resizable()
                            .aspectRatio(contentMode: .fit)}
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0 ))
                    VStack {
                        Text(favorite.name ?? "")
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
                                Text(convertDateFormat(inputDate: favorite.release ?? ""))
                                    .font(Font.custom("Mulish-Regular", size: 15))
                                    .foregroundColor(.white)
                            })
                            Spacer()
                            VStack {
                                Text("Metacritic")
                                    .font(Font.custom("Mulish-Bold", size: 17))
                                    .foregroundColor(Color(hex: 0xA8A8A8))
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0 ))
                                Text("\(favorite.metacritic ?? 0)")
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
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle(Text("RAWG"))
        .navigationBarItems(
            trailing:
                self.isSaved
                ?
                Button(action: {
                    self.isSaved = !self.deleteFavoriteViewModel.deleteFavorites(id: Int(self.favorite.id ?? 0))
                }, label: {
                    Image("icon_favorite_solid").imageScale(.large)
                })
                :
                Button(action: {
                    self.isSaved = self.addFavoriteViewModel.addFavorite(favorite: self.favorite)
                }, label: {
                    Image("icon_favorite").imageScale(.large)
                })
        )
    }
}
