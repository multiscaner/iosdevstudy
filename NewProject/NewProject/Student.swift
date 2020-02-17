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
    let age: Int
    let gender: Gender
    let avatar: UIImage
}

enum Gender {
    case female
    case male
}

