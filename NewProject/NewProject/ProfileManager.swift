//
//  ProfileManager.swift
//  NewProject
//
//  Created by UjiN on 2/21/20.
//  Copyright © 2020 UjiN. All rights reserved.
//

import Foundation
class ProfileManager {
    
    static let shared = ProfileManager()
    
    var login: String?
    var password: String?
    
    init(){}
}
