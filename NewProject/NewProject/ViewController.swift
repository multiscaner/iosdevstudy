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
        validMessage.textColor = .red

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
        validMessage.isHidden = true


        switch (validator.isValidLogin(testStr: loginTextField.text), validator.isValidPassword(testStr: passwordTextField.text)) {
        case (.invalid(let error), _), (_, .invalid(let error)):
            validMessage.text = error
            validMessage.isHidden = false
        case (.valid, .valid):
            performSegue(withIdentifier: "sega", sender: self)
            profileManager.login = loginTextField.text!
            profileManager.password = passwordTextField.text!
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navigationController = segue.destination as? UINavigationController, let welcomeController = navigationController.topViewController as? WelcomeViewController {
            if let loginText = loginTextField.text {
                welcomeController.label = "Welcome, \(loginText)"
            }
        }
    }
}

