//
//  Student.swift
//  NewProject
//
//  Created by UjiN on 2/17/20.
//  Copyright © 2020 UjiN. All rights reserved.
//

import Foundation
import UIKit



struct Student {
    let name: String
    let surName: String
    let gender: Gender?
    let email: String?
    //    let age: Int
    //    let avatar: UIImage?
    init(name: String, surName: String, gender: Gender? = nil, email: String? = nil) {
        self.name = name
        self.surName = surName
        self.gender = gender
        self.email = email
    }
}

enum Gender: String {
    case female
    case male
}

