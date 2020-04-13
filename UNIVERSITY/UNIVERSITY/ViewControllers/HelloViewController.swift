//
//  HelloViewController.swift
//  UNIVERSITY
//
//  Created by UjiN on 4/9/20.
//  Copyright © 2020 UjiN. All rights reserved.
//

import UIKit

class HelloViewController: UIViewController {

	@IBOutlet weak var helloLabel: UILabel!
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
	 navigationController?.navigationBar.shadowImage = UIImage()

	}
	
	@IBAction func logOut(_ sender: UIButton) {
		performSegue(withIdentifier: "logOutSegue", sender: nil)
		UserDefaults.standard.set(false, forKey: "login")
	}
	
	
}
