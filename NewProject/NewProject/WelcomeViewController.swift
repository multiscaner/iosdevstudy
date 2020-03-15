//
//  WelcomeViewController.swift
//  NewProject
//
//  Created by UjiN on 2/16/20.
//  Copyright © 2020 UjiN. All rights reserved.
//

import UIKit
enum AnimationSteps {
	case first
	case second
	case third
}

class WelcomeViewController: UIViewController {
	
	@IBOutlet weak var zhmyakButton: UIButton!
	@IBOutlet weak var welcomeLabel: UILabel!
	@IBOutlet weak var buttonHeightConstraint: NSLayoutConstraint!
	@IBOutlet weak var buttonVerticalSpacingConstraint: NSLayoutConstraint!
	var step = AnimationSteps.first
	
	var label = String()
	override func viewDidLoad() {
		super.viewDidLoad()
		welcomeLabel.text = label
		zhmyakButton.backgroundColor = .gray
	}
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let profileViewController = segue.destination as? ProfileViewController {
			let name = "\(ProfileManager.shared.login ?? "Where is a login?")"
			let surName = "\(ProfileManager.shared.password ?? "Where is a password?")"
			let email = ProfileManager.shared.email
			profileViewController.student = Student(name: name, surName: surName, gender: .cat, email: email)
		}
	}
	
	@IBAction func changeSelfButton(_ sender: UIButton) {
		switch step {
		case .first:
			buttonHeightConstraint.constant = 200
			UIView.animate(withDuration: 2) {
				self.view.layoutIfNeeded()
			}
			step = .second
		case .second:
			UIView.animate(withDuration: 2) {
				self.zhmyakButton.layer.cornerRadius = self.zhmyakButton.bounds.height / 2
				self.zhmyakButton.backgroundColor = UIColor.red
			}
			step = .third
		case .third:
			buttonVerticalSpacingConstraint.constant = 400
			UIView.animate(withDuration: 0.5) {
				self.view.layoutIfNeeded()
			}
		}
	}
}
