//
//  UserViewController.swift
//  Navigation
//
//  Created by MacBook on 14.09.2022.
//

import UIKit

class User {
    
    var userLogin: String
    var userName: String
    var userAvatar: UIImage
    var userStatus: String

    init(userLogin: String, userName: String, userAvatar: String, userStatus: String) {
        self.userLogin = userLogin
        self.userName = userName
        self.userAvatar = UIImage(named: userAvatar)!
        self.userStatus = userStatus
    }
}
