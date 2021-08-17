//
//  FavoriteRow.swift
//  RAWG
//
//  Created by Agung Tri Utomo on 15/08/21.
//

import URLImage
import SwiftUI

struct FavoriteRow: View {
    var favorite: FavoriteModel
    var body: some View {
        ZStack {
            Color(hex: 0x202020).ignoresSafeArea()
                .cornerRadius(10)
            VStack {
                URLImage(URL(string: "\(favorite.backgroundImage ?? "")")!) { proxy in
                    proxy.resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width/2.3,
                               height: UIScreen.main.bounds.height/6,
                               alignment: .center)
                        .clipped()
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
                }
                VStack(alignment: .leading, spacing: 0, content: {
                    HStack {
                        Text("\(favorite.name ?? "")")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(Font.custom("Mulish-Regular", size: 15))
                            .foregroundColor(.white)
                        Spacer()
                        Text("\(favorite.metacritic ?? 0)")
                            .font(Font.custom("Mulish-Regular", size: 15))
                            .foregroundColor(.yellow)
                            .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4 ))
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.yellow, lineWidth: 1))
                    }.padding(EdgeInsets(top: 0, leading: 8, bottom: 4, trailing: 8 ))
                    Text("\(convertDateFormat(inputDate: favorite.release ?? ""))")
                        .font(Font.custom("Mulish-Regular", size: 13))
                        .foregroundColor(.gray)
                        .padding(EdgeInsets(top: 0, leading: 8, bottom: 8, trailing: 8 ))
                })
            }
            .cornerRadius(10)
        }.frame(width: UIScreen.main.bounds.width/2.3, height: UIScreen.main.bounds.height/6)
    }
}
