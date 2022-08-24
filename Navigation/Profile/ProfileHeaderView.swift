//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by MacBook on 19.07.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private lazy var avatarImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "detectlogo")
        imageView.backgroundColor = .darkGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var userName: UILabel = {
        let userName = UILabel()
        userName.text = "Detect24"
        userName.textColor = .black
        userName.font = UIFont.boldSystemFont(ofSize: 18)
        userName.translatesAutoresizingMaskIntoConstraints = false
        return userName
    }()
    
    private var statusText: String?

    private lazy var userStatus: UILabel = {
        let userStatus = UILabel()
        userStatus.text = self.statusText ?? "Делаю ДЗ"
        userStatus.textColor = .darkGray
        userStatus.font = UIFont.systemFont(ofSize: 14)
        userStatus.translatesAutoresizingMaskIntoConstraints = false
        return userStatus
    }()
    
    private lazy var statusField: UITextField = {
        let statusField = UITextField()
        statusField.backgroundColor = .white
        statusField.textColor = .black
        statusField.font = UIFont.systemFont(ofSize: 15)
        statusField.addTarget(self, action: #selector(self.statusTextChanged), for: .editingChanged)
        statusField.translatesAutoresizingMaskIntoConstraints = false
        statusField.addPaddingLeft(20)
        return statusField
    }()
    
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Изменить статус", for: .normal)
        button.addTarget(self, action: #selector(self.buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.avatarImage.layer.cornerRadius = self.avatarImage.frame.height / 2
        self.avatarImage.clipsToBounds = true
        self.avatarImage.layer.borderWidth = 3
        self.avatarImage.layer.borderColor = UIColor.white.cgColor
        
        self.statusField.layer.cornerRadius = 12
        self.statusField.layer.borderWidth = 1
        self.statusField.layer.borderColor = UIColor.black.cgColor
        
        self.button.layer.cornerRadius = 4
        self.button.layer.shadowOffset = .init(width: 4, height: 4)
        self.button.layer.shadowRadius = 4
        self.button.layer.shadowColor = UIColor.black.cgColor
        self.button.layer.shadowOpacity = 0.7
        
    }
    
    private func setupView() {
        self.addSubview(self.avatarImage)
        self.addSubview(self.userName)
        self.addSubview(self.userStatus)
        self.addSubview(self.statusField)
        self.addSubview(self.button)
        
        NSLayoutConstraint.activate([        
            self.avatarImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.avatarImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.avatarImage.widthAnchor.constraint(equalToConstant: 96),
            self.avatarImage.heightAnchor.constraint(equalToConstant: 96),

            self.userName.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            self.userName.leadingAnchor.constraint(equalTo: self.avatarImage.trailingAnchor, constant: 16),
            self.userName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            

            self.userStatus.topAnchor.constraint(equalTo: self.userName.topAnchor, constant: 30),
            self.userStatus.leadingAnchor.constraint(equalTo: self.avatarImage.trailingAnchor, constant: 16),
            self.userStatus.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),

            self.statusField.topAnchor.constraint(equalTo: self.userStatus.bottomAnchor),
            self.statusField.leadingAnchor.constraint(equalTo: self.avatarImage.trailingAnchor, constant: 16),
            self.statusField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.statusField.heightAnchor.constraint(equalToConstant: 40),

            self.button.topAnchor.constraint(equalTo: self.statusField.bottomAnchor, constant: 10),
            self.button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.button.heightAnchor.constraint(equalToConstant: 50),
//            self.button.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -32),
            self.button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
    }
    
    @objc private func buttonPressed() {
        userStatus.text = statusField.text
    }
    @objc func statusTextChanged(_ textField: UITextField) {
        self.statusText = statusField.text
    }
}
