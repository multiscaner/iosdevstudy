//
//  ProfileViewController.swift
//  UNIVERSITY
//
//  Created by UjiN on 4/12/20.
//  Copyright © 2020 UjiN. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
	@IBOutlet weak var icon: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var userNameLabel: UILabel!
	@IBOutlet weak var companyLabel: UILabel!
	
	var person: Person?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
	if let pers = person {
		icon.image = UIImage(named: "icon")
		nameLabel.text = pers.name
		userNameLabel.text = pers.username
		companyLabel.text = pers.company.name
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
}
