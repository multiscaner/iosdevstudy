//
//  ViewController.swift
//  NewProject
//
//  Created by UjiN on 2/16/20.
//  Copyright © 2020 UjiN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func goToAnotherScreen(_ sender: UIButton) {
        
        guard let login = loginTextField.text, login.count > 0 else {
            let alert = UIAlertController(title: "Введите логин", message: "", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ещё раз", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        guard let password = passwordTextField.text, password.count >= 6 else {
            let alert = UIAlertController(title: "Введите пароль", message: "Не менее 6 символов", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ещё раз", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        performSegue(withIdentifier: "sega", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navigationController = segue.destination as? UINavigationController, let welcomeController = navigationController.topViewController as? WelcomeViewController {
            if let loginText = loginTextField.text {
                welcomeController.label = "Welcome, \(loginText)"
            }
        }
        
    }
    
}
