//
//  LogInViewController.swift
//  UNIVERSITY
//
//  Created by UjiN on 4/11/20.
//  Copyright © 2020 UjiN. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
	
	var storage = Storage()
	
	@IBOutlet weak var loginTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		

        // Do any additional setup after loading the view.
    }
	@IBAction func logIn(_ sender: UIButton) {
		guard let name = loginTextField.text, let pass = passwordTextField.text else { return }
		let dic = storage.loadData()
		if dic[name] == pass {
			performSegue(withIdentifier: "segue", sender: nil)
			UserDefaults.standard.set(true, forKey: "login")
		}
	}
}
