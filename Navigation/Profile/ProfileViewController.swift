//
//  ProfileViewController.swift
//  Navigation
//
//  Created by MacBook on 13.07.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        let profileHeaderView = ProfileHeaderView()
//        profileHeaderView.backgroundColor = .systemRed
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        return profileHeaderView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Профиль заголовок"
        

        self.view.backgroundColor = .lightGray
        self.view.addSubview(self.profileHeaderView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.profileHeaderView.frame = self.view.bounds
    }
}
