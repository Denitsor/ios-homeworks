//
//  SceneDelegate.swift
//  Navigation
//
//  Created by MacBook on 13.07.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
     
        guard let wc = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: wc)
//        let lenta = UINavigationController(rootViewController: LentaViewController())
        let lenta = FeedViewController()
        let profile = ProfileViewController()
        
        let lentaNavigationController = UINavigationController(rootViewController: lenta)
        let profileNavigationController = UINavigationController(rootViewController: profile)
        
        let tabBarController = UITabBarController()
        lenta.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "list.bullet.rectangle.fill"), tag: 0 )
        profile.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.fill"), tag: 0 )
        tabBarController.viewControllers = [lentaNavigationController, profileNavigationController]
        tabBarController.tabBar.backgroundColor = .white
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
    }

}

