//
//  ProfileCoordinator.swift
//  Navigation
//
//  Created by MacBook on 18.10.2022.
//

import Foundation
import UIKit

 class ProfileCoordinator {
     
     let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
     
     func startView() {
         
        #if DEBUG
            let userService = TestUserService()
        #else
            let userService = CurrentUserService()
        #endif
         
         let profileVC = ProfileViewController(currentUser: userService.user)
         navigationController.pushViewController(profileVC, animated: true)
     }
 }
