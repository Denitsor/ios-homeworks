//
//  LoginViewControllerDelegate.swift
//  Navigation
//
//  Created by MacBook on 27.09.2022.
//

import Foundation

protocol LoginViewControllerDelegate {
    
    func check(loginDelegate: String, passwordDelegate: String) -> Bool

    
}
