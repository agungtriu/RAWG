//
//  GameDetail.swift
//  RAWG
//
//  Created by Agung Tri Utomo on 11/08/21.
//

import SwiftUI
import URLImage

struct GameDetailView: View {
    var gameId: Int
    var backgroundImage: String
    @ObservedObject var gameDetailViewModel = GameDetailViewModel()
    var genre: some View {
        Group {
            Text("Genre")
                .font(Font.custom("Mulish-Bold", size: 17))
                .foregroundColor(Color(hex: 0xA8A8A8))
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 4, trailing: 16 ))
            ScrollView {
                HStack {
                    ForEach(gameDetailViewModel.gameDetail.genres, id: \.id) { genre in
                        Text(genre.name)
                            .font(Font.custom("Mulish-Regular", size: 15))
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4 ))
                            .overlay(RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.white, lineWidth: 1))
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16 ))
            }
        }
    }
    var about: some View {
        Group {
            Text("About")
                .font(Font.custom("Mulish-Bold", size: 17))
                .foregroundColor(Color(hex: 0xA8A8A8))
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 4, trailing: 16 ))
            Text("\(gameDetailViewModel.gameDetail.description)")
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
            ScrollView {
                HStack {
                    ForEach(gameDetailViewModel.gameDetail.developers, id: \.id) { developer in
                        Text(developer.name)
                            .font(Font.custom("Mulish-Regular", size: 15))
                            .foregroundColor(.white)
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16 ))
            }
        }
    }
    var publishers: some View {
        Group {
            Text("Publishers")
                .font(Font.custom("Mulish-Bold", size: 17))
                .foregroundColor(Color(hex: 0xA8A8A8))
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 4, trailing: 16 ))
            ScrollView {
                HStack {
                    ForEach(gameDetailViewModel.gameDetail.publishers, id: \.id) { publisher in
                        Text(publisher.name)
                            .font(Font.custom("Mulish-Regular", size: 15))
                            .foregroundColor(.white)
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16 ))
            }
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
                }
            }
        }.onAppear {
            if self.gameDetailViewModel.gameDetail.name.isEmpty {
                self.gameDetailViewModel.loadGameDataById(gameId: String(self.gameId))
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle(Text("RAWG"))
    }
}
