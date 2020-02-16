//
//  ViewController.swift
//  NewProject
//
//  Created by UjiN on 2/16/20.
//  Copyright © 2020 UjiN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goToAnotherScreen(_ sender: UIButton) {
        performSegue(withIdentifier: "sega", sender: self)
     
    }
    
}

