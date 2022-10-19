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
         
         let profileViewModel = ProfileViewModel(currentUser: userService.user)
         let profileVC = ProfileViewController(profileViewModel: profileViewModel)
         navigationController.pushViewController(profileVC, animated: true)
     }
 }
