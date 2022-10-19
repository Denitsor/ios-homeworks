//
//  ProfileViewModel.swift
//  Navigation
//
//  Created by MacBook on 19.10.2022.
//

import UIKit

final class ProfileViewModel {
    var currentUser: User
    lazy var posts: [Post] = []
    lazy var profileHeaderView = ProfileHeaderView()
    
    init(currentUser: User) {
        self.currentUser = currentUser
    }
    
    func setUserDetails(userData: User) {
        profileHeaderView.userStatus.text = userData.userStatus //self.statusText ?? userData.userStatus
        profileHeaderView.userName.text = userData.userName
        profileHeaderView.avatarImage.image = userData.userAvatar //UIImage(named: avatarImage)
    }
}
