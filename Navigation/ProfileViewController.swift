//
//  ProfileViewController.swift
//  Navigation
//
//  Created by MacBook on 13.07.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Профиль заголовок"
        
        
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.fill"), tag: 0 )
        self.tabBarItem = tabBarItem
        
        self.view.backgroundColor = .green
    }
}
