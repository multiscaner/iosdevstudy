//
//  WelcomeViewController.swift
//  NewProject
//
//  Created by UjiN on 2/16/20.
//  Copyright © 2020 UjiN. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var label = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = label
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let profileViewController = segue.destination as? ProfileViewController {
            profileViewController.student = Student(name: "\(ProfileManager.shared.login ?? "Where is a login?")", surName: "\(ProfileManager.shared.password ?? "Where is a password?")", email: ProfileManager.shared.email)
        }
    }
}
