//
//  ProfileViewController.swift
//  NewProject
//
//  Created by UjiN on 2/16/20.
//  Copyright © 2020 UjiN. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surNameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    var student: Student?

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if let student = student {
//            nameLabel.text = "\(student.name)"
//            genderLabel.text = "\(student.gender)"
//            surNameLabel.text = "\(student.surName)"
//            photo.image = student.avatar
//            ageLabel.text = "\(student.age)"
//        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
