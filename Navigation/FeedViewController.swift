//
//  LentaViewController.swift
//  Navigation
//
//  Created by MacBook on 13.07.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    private lazy var btnStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .red
        
        return stack
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Перейти", for: .normal)
        button.addTarget(self, action: #selector(self.didTabButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var button2: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("Перейти", for: .normal)
        button.addTarget(self, action: #selector(self.didTabButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Лента заголовок"
        
        self.view.backgroundColor = .systemCyan
        self.view.addSubview(btnStack)
        self.btnStack.addArrangedSubview(self.button)
        self.btnStack.addArrangedSubview(self.button2)
        self.setupFeedView()
    }
    
    private func setupFeedView() {
        NSLayoutConstraint.activate([
            self.btnStack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.btnStack.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    @objc private func didTabButton() {
        let postView = PostViewController()
//        postView.post = Post(postTitle: "Первый пост")
        self.navigationController?.pushViewController(postView, animated: true)
    }
}
