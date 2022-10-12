//
//  CurrentUserService.swift
//  Navigation
//
//  Created by MacBook on 14.09.2022.
//

import UIKit

class CurrentUserService: UserService {

    let user: User

    init(user: User) {
        self.user = user
    }
    
    func signUser(login: String) -> User? {
        user.userLogin == login ? user : nil
    }
    
}
