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
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var validMessageLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var showPasswordButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        validMessageLabel.textColor = .red
        signInButton.isEnabled = false
        passwordTextField.delegate = self
        loginTextField.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let textFieldText: NSString = (textField.text ?? "") as NSString
        let txtAfterUpdate = textFieldText.replacingCharacters(in: range, with: string)
        
        var login = ""
        var password = ""
        if textField == loginTextField {
            password = passwordTextField.text ?? ""
            login = txtAfterUpdate
        } else if textField == passwordTextField {
            login = loginTextField.text ?? ""
            password = txtAfterUpdate
        }

        switch (validator.isValidLogin(testStr: login), validator.isValidPassword(testStr: password)) {
        case (.invalid(let error), _), (_, .invalid(let error)):
            validMessageLabel.text = error
            validMessageLabel.isHidden = false
            signInButton.isEnabled = false
        case (.valid, .valid):
            validMessageLabel.isHidden = true
            signInButton.isEnabled = true
        }
        return true
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
        performSegue(withIdentifier: "sega", sender: self)
        ProfileManager.shared.login = loginTextField.text!
        ProfileManager.shared.password = passwordTextField.text!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navigationController = segue.destination as? UINavigationController,
            let welcomeController = navigationController.topViewController as? WelcomeViewController {
            if let loginText = loginTextField.text {
            welcomeController.label = "Welcome, \(loginText)"
            }
        }
    }
}

