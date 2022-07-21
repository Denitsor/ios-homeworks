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
        
        return imageView
    }()
    
    private lazy var userName: UILabel = {
        let userName = UILabel()
        userName.text = "Detect24"
        userName.textColor = .black
        userName.font = UIFont.boldSystemFont(ofSize: 18)
        
        return userName
    }()
    
    private var statusText: String?

    private lazy var userStatus: UILabel = {
        let userStatus = UILabel()
        userStatus.text = self.statusText ?? "Делаю ДЗ"
        userStatus.textColor = .darkGray
        userStatus.font = UIFont.systemFont(ofSize: 14)
        
        return userStatus
    }()
    
    private lazy var statusField: UITextField = {
        let statusField = TextFieldWithPadding()
        statusField.backgroundColor = .white
        statusField.textColor = .black
        statusField.font = UIFont.systemFont(ofSize: 15)
        statusField.addTarget(self, action: #selector(self.statusTextChanged), for: .editingChanged)
        
        return statusField
    }()
    
    class TextFieldWithPadding: UITextField {
        var textPadding = UIEdgeInsets(
            top: 10,
            left: 20,
            bottom: 10,
            right: 20
        )

        override func textRect(forBounds bounds: CGRect) -> CGRect {
            let rect = super.textRect(forBounds: bounds)
            return rect.inset(by: textPadding)
        }

        override func editingRect(forBounds bounds: CGRect) -> CGRect {
            let rect = super.editingRect(forBounds: bounds)
            return rect.inset(by: textPadding)
        }
    }
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Изменить статус", for: .normal)
        button.addTarget(self, action: #selector(self.buttonPressed), for: .touchUpInside)
        
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
        self.avatarImage.frame = CGRect(x: 16, y: 108, width: 96, height: 96)
        self.avatarImage.layer.cornerRadius = self.avatarImage.frame.height / 2
        self.avatarImage.clipsToBounds = true
        self.avatarImage.layer.borderWidth = 3
        self.avatarImage.layer.borderColor = UIColor.white.cgColor
        
        self.userName.frame = CGRect(x: 128, y: 119, width: 300, height: 18)
        
        self.userStatus.frame = CGRect(x: 128, y: 172, width: 300, height: 14)
        
        let textFieldWidth = self.frame.width - 144
        self.statusField.frame = CGRect(x: 128, y: 194, width: textFieldWidth, height: 40)
        self.statusField.layer.cornerRadius = 12
        self.statusField.layer.borderWidth = 1
        self.statusField.layer.borderColor = UIColor.black.cgColor
        
        let buttonWidth = self.frame.width - 32
        self.button.frame = CGRect(x: 16, y: 242, width: buttonWidth, height: 50)
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
    }
    
    @objc private func buttonPressed() {
//        self.statusText = statusField.text
        userStatus.text = statusField.text
//        print(self.statusText!, "button")
    }
    @objc func statusTextChanged(_ textField: UITextField) {
        self.statusText = statusField.text
//        print(self.statusText!)
    }
}
