//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by MacBook on 19.07.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private lazy var bgAnimation: UIView = {
        let avaAnimation = UIView()
        avaAnimation.backgroundColor = .black.withAlphaComponent(0)
        avaAnimation.translatesAutoresizingMaskIntoConstraints = false
        return avaAnimation
    }()
    
    private lazy var closeAnimationButton: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.alpha = 0
        button.setImage(UIImage(systemName:"x.circle.fill"), for: .normal)
        button.addTarget(self, action: #selector(self.handleTapCloseGestureRecognizer), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var avatarImage: UIImageView = {
        let imageView = UIImageView()
//        imageView.image = user.userAvatar
        imageView.backgroundColor = .darkGray
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var userName: UILabel = {
        let userName = UILabel()
        userName.text = "Demo"
        userName.textColor = .black
        userName.font = UIFont.boldSystemFont(ofSize: 18)
        userName.translatesAutoresizingMaskIntoConstraints = false
        return userName
    }()
    
    private var statusText: String?

    private lazy var userStatus: UILabel = {
        let userStatus = UILabel()
        userStatus.text = self.statusText ?? "Demo status"
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
    
    private lazy var button: CustomButton = {
        let button = CustomButton(title: "Изменить статус", titleColor: .lightGray)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.buttonTap()
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
        
    }

    func setUserDetails(userData: User) {
        self.userStatus.text = userData.userStatus //self.statusText ?? userData.userStatus
        self.userName.text = userData.userName
        self.avatarImage.image = userData.userAvatar //UIImage(named: avatarImage)
    }
    
    private func setupView() {
        self.addSubview(self.bgAnimation)
        self.addSubview(self.userName)
        self.addSubview(self.userStatus)
        self.addSubview(self.statusField)
        self.addSubview(self.button)
        self.addSubview(self.avatarImage)
        self.addSubview(self.closeAnimationButton)
        self.setupGesture()
        
        NSLayoutConstraint.activate([        
            self.avatarImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.avatarImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.avatarImage.widthAnchor.constraint(equalToConstant: 96),
            self.avatarImage.heightAnchor.constraint(equalToConstant: 96),
            
            self.closeAnimationButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.closeAnimationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            self.bgAnimation.topAnchor.constraint(equalTo: self.topAnchor),
            self.bgAnimation.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.bgAnimation.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.bgAnimation.bottomAnchor.constraint(equalTo: self.bottomAnchor),

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
            self.button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
    }
    
    private func buttonTap() {
        button.activeTap = { [self] in
            userStatus.text = statusField.text
        }
    }
    
    let screenSize: CGRect = UIScreen.main.bounds
    private lazy var startPoint: CGPoint = {
        let start = CGPoint(x: self.avatarImage.center.x, y: self.avatarImage.center.y)
        return start
    }()
    
    private func setupAnimationOn() {
        _ = startPoint
        let ratioBgImageX = self.screenSize.width / self.bgAnimation.frame.width
        let ratioBgImageY = self.screenSize.height / self.bgAnimation.frame.height
        let ratioAvatarImage = self.screenSize.width / self.avatarImage.frame.width
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut) {
            self.bgAnimation.backgroundColor = .black.withAlphaComponent(0.6)
            self.bgAnimation.center = CGPoint(x: self.screenSize.width / 2, y: self.screenSize.height / 2)
            self.bgAnimation.transform = CGAffineTransform(scaleX: ratioBgImageX, y: ratioBgImageY)
            
            self.avatarImage.center = CGPoint(x: self.screenSize.width / 2, y: self.screenSize.height / 2)
            self.avatarImage.transform = CGAffineTransform(scaleX: ratioAvatarImage, y: ratioAvatarImage)
            self.avatarImage.layer.cornerRadius = 0
            
        } completion: { _ in
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut) {
                    self.closeAnimationButton.layer.opacity = 1.0
                }
        }
    }
    
    private func setupAnimationOff(startpoint: CGPoint) {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut) {
            self.bgAnimation.backgroundColor = .black.withAlphaComponent(0)
            self.bgAnimation.center = CGPoint(x: 0, y: 0)
            self.bgAnimation.transform = .identity
            
            self.avatarImage.transform = .identity
            self.avatarImage.center = CGPoint(x: startpoint.x, y: startpoint.y)
            self.avatarImage.layer.cornerRadius = self.avatarImage.frame.height / 2
            
        } completion: { _ in
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut) {
                    self.closeAnimationButton.layer.opacity = 0.0
                }
        }
    }
    
    private func setupGesture() {
        let tapCloseAvatarImage = UITapGestureRecognizer()
        tapCloseAvatarImage.addTarget(self, action: #selector(handleTapCloseGestureRecognizer(_:)))
        self.closeAnimationButton.addGestureRecognizer(tapCloseAvatarImage)
        
        let tapClickAvatarImage = UITapGestureRecognizer()
        tapClickAvatarImage.addTarget(self, action: #selector(handleTapGestureRecognizer(_:)))
        self.avatarImage.addGestureRecognizer(tapClickAvatarImage)
    }
    
    @objc private func handleTapGestureRecognizer(_ gesture: UITapGestureRecognizer) {
        self.setupAnimationOn()
    }
    @objc private func handleTapCloseGestureRecognizer(_ gesture: UITapGestureRecognizer) {
        self.setupAnimationOff(startpoint: startPoint)
    }
    @objc func statusTextChanged(_ textField: UITextField) {
        self.statusText = statusField.text
    }
}
