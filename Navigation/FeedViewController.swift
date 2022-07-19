//
//  LentaViewController.swift
//  Navigation
//
//  Created by MacBook on 13.07.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Перейти", for: .normal)
        button.addTarget(self, action: #selector(self.didTabButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Лента заголовок"
        
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "list.bullet.rectangle.fill"), tag: 0 )
        self.tabBarItem = tabBarItem
        self.view.backgroundColor = .cyan
        self.view.addSubview(self.button)
        self.button.frame = CGRect(x: 120, y: 120, width: 200, height: 50)
        
    }
    
    @objc private func didTabButton() {
        let postView = PostViewController()
        postView.post = Post(postTitle: "Первый пост")
        self.navigationController?.pushViewController(postView, animated: true)
    }
}
