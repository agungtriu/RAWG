//
//  Profile.swift
//  RAWG
//
//  Created by Agung Tri Utomo on 15/08/21.
//

import Foundation
struct Profile {
    static let nameKey = "name"
    static let emailKey = "email"
    static let githubKey = "github"
    static let linkedinKey = "linkedin"
    static var name: String {
        get {
            return UserDefaults.standard.string(forKey: nameKey) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: nameKey)
        }
    }
    static var email: String {
        get {
            return UserDefaults.standard.string(forKey: emailKey) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: emailKey)
        }
    }
    static var github: String {
        get {
            return UserDefaults.standard.string(forKey: githubKey) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: githubKey)
        }
    }
    static var linkedin: String {
        get {
            return UserDefaults.standard.string(forKey: linkedinKey) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: linkedinKey)
        }
    }
    static func synchronize() {
        UserDefaults.standard.synchronize()
    }
}
