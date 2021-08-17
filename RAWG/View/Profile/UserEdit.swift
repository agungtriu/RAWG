//
//  UserEdit.swift
//  RAWG
//
//  Created by Agung Tri Utomo on 15/08/21.
//

import SwiftUI

struct UserEdit: View {
    @State private var name = Profile.name
    @State private var email = Profile.email
    @State private var github = Profile.github
    @State private var linkedin = Profile.linkedin
    @State private var showsAlert = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(alignment: .leading, spacing: nil, content: {
                Form {
                    Section(header: Text("Name")
                                .font(Font.custom("Mulish-Bold", size: 17))
                                .foregroundColor(.white)) {
                        TextField("", text: $name).font(Font.custom("Mulish-Bold", size: 17))
                    }.textCase(.none)
                    Section(header: Text("Email")
                                .font(Font.custom("Mulish-Bold", size: 17))
                                .foregroundColor(.white)) {
                        TextField("", text: $email).font(Font.custom("Mulish-Bold", size: 17))
                    }.textCase(.none)
                    Section(header: Text("GitHub")
                                .font(Font.custom("Mulish-Bold", size: 17))
                                .foregroundColor(.white)) {
                        TextField("", text: $github).font(Font.custom("Mulish-Bold", size: 17))
                    }.textCase(.none)
                    Section(header: Text("LinkedIn")
                                .font(Font.custom("Mulish-Bold", size: 17))
                                .foregroundColor(.white)) {
                        TextField("", text: $linkedin).font(Font.custom("Mulish-Bold", size: 17))
                    }.textCase(.none)
                }.background(Color.black)
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        if name.isEmpty || email.isEmpty || github.isEmpty || linkedin.isEmpty {
                            self.showsAlert.toggle()
                        } else {
                            Profile.name = name
                            Profile.email = email
                            Profile.github = github
                            Profile.linkedin = linkedin
                            Profile.synchronize()
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }, label: {
                        Text("Save")
                            .font(Font.custom("Mulish-Bold", size: 17))
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height/20, alignment: .center)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 2))
                    }).alert(isPresented: $showsAlert, content: {
                        Alert(title: Text("All fields must be filled"))
                    })
                    Spacer()
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Cancel")
                            .font(Font.custom("Mulish-Bold", size: 17))
                            .foregroundColor(.white).background(Color(hex: 0x121212))
                            .frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height/20, alignment: .center)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 2))
                    })
                    Spacer()
                }.padding(EdgeInsets(top: 8, leading: 16, bottom: 16, trailing: 16))
            })
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle(Text("Edit Profile"))
        .onAppear {
            UITableView.appearance().backgroundColor = .black
            Profile.synchronize()
        }
    }
}

struct UserEdit_Previews: PreviewProvider {
    static var previews: some View {
        UserEdit()
    }
}
