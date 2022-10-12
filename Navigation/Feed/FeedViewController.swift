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
    
    private lazy var button: CustomButton = {
        let button = CustomButton(title: "Перейти", titleColor: .lightGray)
        return button
    }()
    
    private lazy var button2: CustomButton = {
        let button = CustomButton(title: "Перейти2", titleColor: .lightGray)
        button.backgroundColor = .systemGreen
        return button
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.placeholder = "Введите секретное слово"
        textField.clipsToBounds = true
        textField.font = UIFont.systemFont(ofSize: 15)
//        textField.addTarget(self, action: #selector(self.statusTextChanged), for: .editingChanged)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 4
        textField.addPaddingLeft(20)
        return textField
    }()
    
    private lazy var checkGuessButton: CustomButton = {
        let button = CustomButton(title: "Проверка секретного слова", titleColor: .lightGray)
        button.addLeftRightPadding(10)
        return button
    }()
    
    private lazy var checkLabel: UILabel = {
        let checkLabel = UILabel()
        checkLabel.backgroundColor = .lightGray
        checkLabel.clipsToBounds = true
        checkLabel.layer.cornerRadius = 10
        checkLabel.layer.borderWidth = 0.5
        checkLabel.layer.borderColor = UIColor.darkGray.cgColor
        return checkLabel
    }()
    
    
    private func buttonTap() {
        let postView = PostViewController()
        button.activeTap = { [self] in
           self.navigationController?.pushViewController(postView, animated: true)
        }
        button2.activeTap = { [self] in
           self.navigationController?.pushViewController(postView, animated: true)
        }
        checkGuessButton.activeTap = { [self] in
            if let secredText = textField.text {
                if FeedModel().check(word: secredText) == true {
                    checkLabel.backgroundColor = .green
                } else {
                    checkLabel.backgroundColor = .red
                }
                    
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Лента заголовок"
        
        #if DEBUG
            self.view.backgroundColor = .systemRed
        #else
            self.view.backgroundColor = .systemBackground
        #endif
        
        self.view.addSubview(btnStack)
        self.btnStack.addArrangedSubview(self.button)
        self.btnStack.addArrangedSubview(self.button2)
        self.btnStack.addArrangedSubview(self.textField)
        self.btnStack.addArrangedSubview(self.checkGuessButton)
        self.btnStack.addArrangedSubview(self.checkLabel)
        self.setupFeedView()
        self.buttonTap()
    }
    
    private func setupFeedView() {
        NSLayoutConstraint.activate([
            self.btnStack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.btnStack.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
}
