//
//  AboutMe.swift
//  RAWG
//
//  Created by Agung Tri Utomo on 12/08/21.
//

import SwiftUI

struct AboutMe: View {
    @State private var name = ""
    @State private var email = ""
    @State private var github = ""
    @State private var linkedin = ""
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                NavigationLink(destination: UserEdit()) {
                    Image("icon_user_edit").imageScale(.large)
                }.frame(width: UIScreen.main.bounds.width, alignment: .trailing)
                .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 32))
                Image("foto")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.height/8*5, height: UIScreen.main.bounds.height/4)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .padding(EdgeInsets(top: 32, leading: 16, bottom: 32, trailing: 16))
                Text(name)
                    .font(Font.custom("Mulish-Bold", size: 17))
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                VStack(alignment: .leading, spacing: nil, content: {
                    HStack {
                        Image("icon_mail")
                        Text(email)
                            .font(Font.custom("Mulish-Regular", size: 15))
                            .foregroundColor(Color(hex: 0xA8A8A8))
                            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                    }
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16))
                    HStack {
                        Image("icon_github")
                        Text("github.com/\(github)")
                            .font(Font.custom("Mulish-Regular", size: 15))
                            .foregroundColor(Color(hex: 0xA8A8A8))
                            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                    }
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16))
                    HStack {
                        Image("icon_linkedin")
                        Text("linkedin.com/in/\(linkedin)/")
                            .font(Font.custom("Mulish-Regular", size: 15))
                            .foregroundColor(Color(hex: 0xA8A8A8))
                            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                    }
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                })
                Spacer()
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            if Profile.name.isEmpty {
                Profile.name = "Agung Tri Utomo"
                Profile.email = "agungtriu@outlook.com"
                Profile.github = "agungtriu"
                Profile.linkedin = "agungtriu"
            }
            Profile.synchronize()
            name = Profile.name
            email = Profile.email
            github = Profile.github
            linkedin = Profile.linkedin
        }
    }
}

struct AboutMe_Previews: PreviewProvider {
    static var previews: some View {
        AboutMe()
    }
}
