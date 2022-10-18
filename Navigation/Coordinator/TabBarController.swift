//
//  TabBarController.swift
//  Navigation
//
//  Created by MacBook on 18.10.2022.
//

import UIKit

class TabBarController: UITabBarController {

    private let feedVC = Factory(navigationController: UINavigationController(), viewController: .feed)
    private let profileVC = Factory(navigationController: UINavigationController(), viewController: .profile)

    override func viewDidLoad() {
        super.viewDidLoad()
        setControllers()
    }

    func setControllers() {
        self.tabBar.backgroundColor = .white
        viewControllers = [
            feedVC.navigationController,
            profileVC.navigationController
        ]
    }
}

