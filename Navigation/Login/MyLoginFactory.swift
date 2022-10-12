//
//  MyLoginFactory.swift
//  Navigation
//
//  Created by MacBook on 03.10.2022.
//

import Foundation

struct MyLoginFactory: LoginFactory {
    
    func makeLoginInspector() -> LoginInspector {
        let loginInspector = LoginInspector()
        return loginInspector
    }
    

}
