//
//  UserService.swift
//  Navigation
//
//  Created by MacBook on 14.09.2022.
//

import UIKit

protocol UserService {
    func signUser(login: String) -> User?
}
