//
//  AboutMe.swift
//  RAWG
//
//  Created by Agung Tri Utomo on 12/08/21.
//

import SwiftUI

struct AboutMe: View {
    var body: some View {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack {
                    Image("foto")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.height/8*5, height: UIScreen.main.bounds.height/4)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .padding(EdgeInsets(top: 32, leading: 16, bottom: 16, trailing: 16))
                        Text("Agung Tri Utomo")
                            .font(Font.custom("Mulish-Bold", size: 17))
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 4, trailing: 16))
                        Text("agungtriu@outlook.com")
                            .font(Font.custom("Mulish-Regular", size: 15))
                            .foregroundColor(Color(hex: 0xA8A8A8))
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                    Spacer()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle(Text("Profil"))
    }
}

struct AboutMe_Previews: PreviewProvider {
    static var previews: some View {
        AboutMe()
    }
}
