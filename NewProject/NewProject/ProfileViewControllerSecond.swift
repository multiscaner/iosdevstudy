//
//  ProfileViewController_2.swift
//  NewProject
//
//  Created by UjiN on 3/12/20.
//  Copyright © 2020 UjiN. All rights reserved.
//

import UIKit

class ProfileViewControllerSecond: UIViewController {
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surNameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!

    var student: Student?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let student = student {
            nameLabel.text = "\(student.name)"
            genderLabel.text = "\(student.gender ?? .female)"
            surNameLabel.text = "\(student.surName)"
            emailLabel.text = student.email

            switch student.gender {
            case .female:
                photo.image = #imageLiteral(resourceName: "girl")
            case .male:
                photo.image = #imageLiteral(resourceName: "ric")
            case .none:
                photo.image = UIImage(named: ProfileManager.shared.imageCat)
            }
        }
    }
}
