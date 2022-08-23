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
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        return profileHeaderView
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("Click-click", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Профиль заголовок"
        
        self.view.backgroundColor = .lightGray
        self.view.addSubview(self.profileHeaderView)
        self.view.addSubview(self.button)
        
        self.setupViewProfile()
    }
    
    private func setupViewProfile() {
        
        NSLayoutConstraint.activate([
            self.profileHeaderView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            self.profileHeaderView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            self.profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            self.button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            self.button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.button.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1)
        ])
    }
  
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        self.profileHeaderView.frame = self.view.bounds
//    }
}
