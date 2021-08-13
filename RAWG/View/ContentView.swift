//
//  ContentView.swift
//  RAWG
//
//  Created by Agung Tri Utomo on 11/08/21.
//

import SwiftUI

struct ContentView: View {
    init() {
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [.font: UIFont(name: "Mulish-Bold", size: 17)!,
                                                            .foregroundColor: UIColor.white]
        UINavigationBar.appearance().barTintColor = UIColor.black
    }
    var body: some View {
        NavigationView {
            GamesList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
