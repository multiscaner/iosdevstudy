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
	@IBOutlet weak var ageLabel: UILabel!
	@IBOutlet weak var emailLabel: UILabel!
	@IBOutlet weak var genderLabel: UILabel!
	
	var student: Student?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.photo.layer.borderWidth = 0
		
		if let student = student {
			nameLabel.text = student.name
			genderLabel.text = "\(student.gender)"
			surNameLabel.text = student.surName
			emailLabel.text = student.email
			
			switch student.gender {
			case .female:
				photo.image = UIImage(named: "girl")
			case .male:
				photo.image = UIImage(named: "rik")
			case .cat:
				photo.image = UIImage(named: ProfileManager.shared.imageCat)
			}
		}
	}
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(true)
		UIView.animate(withDuration: 5) {
			self.photo.layer.borderWidth = 15
			self.photo.layer.cornerRadius = self.photo.bounds.width / 2
			self.photo.layer.borderColor = UIColor.red.cgColor
		}
	}
}
