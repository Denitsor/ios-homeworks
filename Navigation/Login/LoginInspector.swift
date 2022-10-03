//
//  LoginInspector.swift
//  Navigation
//
//  Created by MacBook on 30.09.2022.
//

import Foundation

struct LoginInspector: LoginViewControllerDelegate {
    
    func check(loginDelegate: String, passwordDelegate: String) -> Bool {
        
        return Checker.shared.check(login: loginDelegate, password: passwordDelegate)
    }

}
