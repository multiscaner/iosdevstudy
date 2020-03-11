//
//  ProfileManager.swift
//  NewProject
//
//  Created by UjiN on 2/21/20.
//  Copyright © 2020 UjiN. All rights reserved.
//

import Foundation
class ProfileManager {

    func writeToUserdefault() {
        let userDefault = UserDefaults.standard
        userDefault.set(ProfileManager.shared.login, forKey: "Login")
        userDefault.set(ProfileManager.shared.password, forKey: "Password")

    }

    func readToUserdefault() {
        let userDefault = UserDefaults.standard
        ProfileManager.shared.login = userDefault.string(forKey: "Login")
        ProfileManager.shared.password = userDefault.string(forKey: "Password")
    }

    static let shared = ProfileManager()

    var login: String?
    var password: String?
    var email: String?

    private init() {}
}
extension ProfileManager {
    var imageCat: String {
         return "cat"
    }
}
