//
//  TestUserService.swift
//  Navigation
//
//  Created by MacBook on 15.09.2022.
//

import UIKit

class TestUserService: UserService {
    
    var user: User = User(userLogin: "admin",
                          userName: "Администратор",
                          userAvatar: "detectlogo",
                          userStatus: "момент")
//    init(user: User) {
//        self.user = user
//    }
    
    func signUser(login: String) -> User? {
        user.userLogin == login ? user : nil
    }
    

}
