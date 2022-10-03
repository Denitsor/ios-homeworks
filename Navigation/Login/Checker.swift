//
//  Checker.swift
//  Navigation
//
//  Created by MacBook on 27.09.2022.
//

import Foundation

final class Checker {
    static let shared = Checker()
    private init() {}
    
    private let login: String = "admin"
    private let password: String = "123"
    
    func check(login: String, password: String) -> Bool {
        if self.login == login && self.password == password  {
            return true
        } else {
            print("Неверный логин или пароль")
            return false
        }
    }
}
extension Checker: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}
