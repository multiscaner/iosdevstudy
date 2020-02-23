//
//  ViewController.swift
//  NewProject
//
//  Created by UjiN on 2/16/20.
//  Copyright © 2020 UjiN. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let validator = Validator()
    var isSecure = true
    let profileManager = ProfileManager(login: "", password: "")
    
    @IBOutlet weak var validMessage: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var showPasswordButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        validMessage.isHidden = true
        
    }
    
    @IBAction func showPassword(_ sender: UIButton) {
        isSecure = !isSecure
        passwordTextField.isSecureTextEntry = isSecure
        if isSecure {
            showPasswordButton.setTitle("Show password", for: .normal)
        } else {
            showPasswordButton.setTitle("Hide password", for: .normal)
        }
    }
    
    @IBAction func goToAnotherScreen(_ sender: UIButton) {
        
        validMessage.isHidden = false
        validMessage.textColor = .red
        
        guard let log = loginTextField.text, log.count >= 2 else {
            validMessage.text = "Введите минимум 2 символа в поле Login"
            return
        }
        guard let pass = passwordTextField.text, pass.count >= 6 else {
            validMessage.text = "Введите минимум 6 символов в поле Password"
            return
        }
        if validator.isValidPassword(testStr: pass) == false {
            validMessage.text = "Пароль должен содержать буквы и цифры"
            return
        }
        if validator.isValidLogin(testStr: log) == false {
            validMessage.text = "Логин должен содержать буквы и цифры"
            return
        }
        
        performSegue(withIdentifier: "sega", sender: self)
        
        profileManager.login = log
        profileManager.password = pass
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navigationController = segue.destination as? UINavigationController, let welcomeController = navigationController.topViewController as? WelcomeViewController {
            if let loginText = loginTextField.text {
                welcomeController.label = "Welcome, \(loginText)"
            }
        }
    }
}

