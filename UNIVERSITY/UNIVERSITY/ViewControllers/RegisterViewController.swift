//
//  ViewController.swift
//  UNIVERSITY
//
//  Created by UjiN on 4/9/20.
//  Copyright © 2020 UjiN. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
	
	var storage = Storage()
	
	@IBOutlet weak var userTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	@IBAction func signIn(_ sender: UIButton) {
		guard let name = userTextField.text, let pass = passwordTextField.text else { return }
		storage.saveUseData(username: name, password: pass)
		dismiss(animated: true, completion: nil)
	}
}

