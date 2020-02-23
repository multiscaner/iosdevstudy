//
//  Validator.swift
//  NewProject
//
//  Created by UjiN on 2/20/20.
//  Copyright © 2020 UjiN. All rights reserved.
//

import Foundation

class Validator {
    func isValidPassword(testStr: String?) -> Bool {
        guard testStr != nil else { return false }
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$")
        return passwordTest.evaluate(with: testStr)
    }
    
    func isValidLogin(testStr: String?) -> Bool {
          guard testStr != nil else { return false }
          
          let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{2,}$")
          return passwordTest.evaluate(with: testStr)
      }
    
}
