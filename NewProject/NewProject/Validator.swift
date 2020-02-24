//
//  Validator.swift
//  NewProject
//
//  Created by UjiN on 2/20/20.
//  Copyright © 2020 UjiN. All rights reserved.
//

import Foundation

class Validator {
    func isValidPassword(testStr: String?) -> Validitation {
        guard let testStr = testStr, testStr.count >= 6 else { return .invalid(error: "Введите минимум 6 символов в поле Password") }
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$")
        if passwordTest.evaluate(with: testStr) {
            return .valid
        } else {
            return .invalid(error: "Пароль должен содержать буквы и цифры")
        }
    }
    
    func isValidLogin(testStr: String?) -> Validitation {
        guard let testStr = testStr, testStr.count >= 2 else { return .invalid(error: "Введите минимум 2 символа в поле Login") }
          
          let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])[A-Za-z\\d]{2,}$")
        if passwordTest.evaluate(with: testStr) {
            return .valid
        } else {
            return .invalid(error: "Логин может содержать латинские буквы и цифры")
        }
      }
    
}

enum Validitation {
    case valid
    case invalid(error: String)
}
