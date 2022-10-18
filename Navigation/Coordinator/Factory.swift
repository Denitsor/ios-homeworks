//
//  Factory.swift
//  Navigation
//
//  Created by MacBook on 18.10.2022.
//

import Foundation
import UIKit

class Factory {
    enum Views {
        case feed
        case profile
    }

let navigationController: UINavigationController
let viewController: Views

init(navigationController: UINavigationController, viewController: Views) {
    self.navigationController = navigationController
    self.viewController = viewController
    startModule()
}

func startModule() {
    
    switch viewController {
        case .feed:
            let feedCoordinator = FeedCoordinator()
            let controller = FeedViewController(coordinator: feedCoordinator)
            navigationController.tabBarItem = .init(title: "Feed", image: UIImage(systemName: "list.bullet.rectangle.fill"), tag: 0)
            navigationController.setViewControllers([controller], animated: true)
        
        case .profile:
//             let controller = LogInViewController()
            
            let profileCoordinator = ProfileCoordinator(navigationController: navigationController)
            let controller = LogInViewController(coordinator: profileCoordinator)
            controller.loginDelegate = MyLoginFactory().makeLoginInspector()
        
             navigationController.tabBarItem = .init(title: "Profile", image: UIImage(systemName: "person"), tag: 0)
             navigationController.setViewControllers([controller], animated: true)
        }
    }
}
