//
//  ContentView.swift
//  RAWG
//
//  Created by Agung Tri Utomo on 11/08/21.
//

import SwiftUI

struct ContentView: View {
    @State var selectedIndex = 0
    let tabBarImageNamesSelected = ["icon_game_solid", "icon_favorite_solid", "icon_user_solid"]
    let tabBarImageNames = ["icon_game", "icon_favorite", "icon_user"]
    let tabBarNames = ["Game", "Favorite", "Profile"]
    init() {
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [.font: UIFont(name: "Mulish-Bold", size: 17)!,
                                                            .foregroundColor: UIColor.white]
        UINavigationBar.appearance().barTintColor = UIColor.black
    }
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack(spacing: 0) {
                    switch selectedIndex {
                    case 0:
                        GamesList()
                    case 1:
                        FavoritesList()
                    case 2:
                        AboutMe()
                    default:
                        Text("Remaining tabs")
                    }
                    HStack {
                        Spacer()
                        ForEach(0..<3) { number in
                            Button(action: {
                                selectedIndex = number
                            }, label: {
                                VStack {
                                    Image(selectedIndex == number ? tabBarImageNamesSelected[number] : tabBarImageNames[number])
                                    Text(tabBarNames[number])
                                        .font(Font.custom("Mulish-Regular", size: 10))
                                        .foregroundColor(selectedIndex == number ? Color(.white) : Color(hex: 0xA8A8A8))
                                }
                                .padding(EdgeInsets(top: 8, leading: 40, bottom: 8, trailing: 40 ))
                            })
                        }
                        Spacer()
                    }.background(Color(hex: 0x121212))
                }
            }
            .navigationBarTitle("RAWG")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
