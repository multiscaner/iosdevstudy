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
	@IBOutlet weak var yConstraint: NSLayoutConstraint!
	@IBOutlet weak var xConstraint: NSLayoutConstraint!
	
	var person: Person?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		if let pers = person {
			icon.image = UIImage(named: "icon")
			nameLabel.text = pers.name
			userNameLabel.text = pers.username
			companyLabel.text = pers.company.name
		}
		let move = UIPanGestureRecognizer(target: self, action: #selector(moveLabel(_:)))
		icon.addGestureRecognizer(move)
	}
		@objc func moveLabel(_ sender: UIPanGestureRecognizer) {
	//		self.view.bringSubviewToFront(gestureLabel)
			let translation = sender.translation(in: self.view)
	//		gestureLabel.center = CGPoint(x: gestureLabel.center.x + translation.x, y: gestureLabel.center.y + translation.y)
			xConstraint.constant += translation.x
			yConstraint.constant += translation.y
			view.layoutIfNeeded()
			sender.setTranslation(CGPoint.zero, in: self.view)
		}
}
