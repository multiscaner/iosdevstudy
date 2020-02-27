//
//  WelcomeViewController.swift
//  NewProject
//
//  Created by UjiN on 2/16/20.
//  Copyright © 2020 UjiN. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var profileManager: ProfileManager?
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var label = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = label
        
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let profileViewController = segue.destination as? ProfileViewController {
            if let name = profileManager?.login, let password = profileManager?.password {
                profileViewController.student = Student(name: "\(name)", surName: "\(password)", gender: .female)
                
            }
          }
      }
}
