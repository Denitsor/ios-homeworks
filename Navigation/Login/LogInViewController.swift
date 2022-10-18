//
//  LogInViewController.swift
//  Navigation
//
//  Created by MacBook on 16.08.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    private var login: String?
    private var password: String?
    
    let coordinator: ProfileCoordinator

    init(coordinator: ProfileCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var loginDelegate: LoginViewControllerDelegate?
    
    #if DEBUG
        var userService = TestUserService()
    #else
        var userService: UserService?
    #endif    
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var stackFieldView: UIStackView = {
        let stackFieldView = UIStackView()
        stackFieldView.axis = .vertical
        stackFieldView.distribution = .fillEqually
        stackFieldView.layer.cornerRadius = 10
        stackFieldView.layer.borderWidth = 0.5
        stackFieldView.clipsToBounds = true
        stackFieldView.translatesAutoresizingMaskIntoConstraints = false
        return stackFieldView
    }()
    
    private lazy var vkLogo: UIImageView = {
        let vkLogo = UIImageView()
        vkLogo.image = UIImage(named: "logo")
        vkLogo.translatesAutoresizingMaskIntoConstraints = false
        return vkLogo
    }()
    
    private lazy var loginField: UITextField = {
        let loginField = UITextField()
        loginField.tag = 0
        loginField.backgroundColor = .systemGray6
        loginField.textColor = .black
        loginField.font = UIFont.systemFont(ofSize: 16)
        loginField.tintColor = UIColor(named: "accentColor")
        loginField.autocapitalizationType = .none
        loginField.placeholder = "Email or phone"
        loginField.layer.borderWidth = 0.5
        loginField.layer.borderColor = UIColor.lightGray.cgColor
        loginField.addPaddingLeft(20)
        loginField.keyboardType = .default
        loginField.clearButtonMode = .whileEditing
        loginField.delegate = self
        loginField.translatesAutoresizingMaskIntoConstraints = false
        return loginField
    }()
    
    private lazy var passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.tag = 1
        passwordField.backgroundColor = .systemGray6
        passwordField.textColor = .black
        passwordField.font = .systemFont(ofSize: 16)
        passwordField.tintColor = UIColor(named: "accentColor")
        passwordField.autocapitalizationType = .none
        passwordField.placeholder = "Password"
        passwordField.layer.borderWidth = 0.5
        passwordField.layer.borderColor = UIColor.lightGray.cgColor
        passwordField.isSecureTextEntry = true
        passwordField.delegate = self
        passwordField.addPaddingLeft(20)
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        return passwordField
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Log In", for: .normal)
        button.addTarget(self, action: #selector(self.didTabButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupGestures()
        self.setupLoginView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.didShowKeyboard (_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.didHideKeyboard (_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.forcedHidingKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    private func setupLoginView() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.vkLogo)
        self.scrollView.addSubview(self.stackFieldView)
        self.stackFieldView.addArrangedSubview(self.loginField)
        self.stackFieldView.addArrangedSubview(self.passwordField)
        self.scrollView.addSubview(self.button)
        
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            self.vkLogo.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            self.vkLogo.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 120),
            self.vkLogo.heightAnchor.constraint(equalToConstant: 100),
            self.vkLogo.widthAnchor.constraint(equalToConstant: 100),
            
            self.stackFieldView.topAnchor.constraint(equalTo: self.vkLogo.bottomAnchor, constant: 120),
            self.stackFieldView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            self.stackFieldView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            self.stackFieldView.heightAnchor.constraint(equalToConstant: 100),

            self.button.topAnchor.constraint(equalTo: self.stackFieldView.bottomAnchor, constant: 16),
            self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            self.button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func didTabButton() {
        if let login = self.login, let password = self.password {
            if loginDelegate?.check(loginDelegate: login, passwordDelegate: password) == true {
                if let user = userService.signUser(login: login) {
//                    let profileVC = ProfileViewController(currentUser: user)
//                    navigationController?.pushViewController(profileVC, animated: true)
                    self.coordinator.startView()
                } else {
                    showAlert(message: "Неправильно указан логин")
    //                print(login)
                }
            } else {
                showAlert(message: "Неверно введен логин или пароль")
            }
            
        }
        func showAlert(message: String) {
            let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
//        self.navigationController?.pushViewController(ProfileViewController(), animated: true)
    }
    
    @objc private func didShowKeyboard(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height

            let loginButtonBottomPointY = self.button.frame.origin.y + self.button.frame.height
            let keyboardOriginY = self.scrollView.frame.height - keyboardHeight

            let yOffset = keyboardOriginY < loginButtonBottomPointY ? loginButtonBottomPointY - keyboardOriginY + 16 : 0

            self.scrollView.contentOffset = CGPoint(x: 0, y: yOffset)
        }
    }

    @objc private func didHideKeyboard(_ notification: Notification) {
        self.forcedHidingKeyboard()
    }

    @objc private func forcedHidingKeyboard() {
        self.view.endEditing(true)
        self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }

}

extension LogInViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
//        if textField.tag == 0 {
//            self.login = textField.text
//        }
//        if textField.tag == 1 {
//            self.password = textField.text
//        }
    }
//     отслеживает что было написано в текстфилд
        func textFieldDidChangeSelection(_ textField: UITextField) {
            if textField.tag == 0 {
                self.login = textField.text
            }
            if textField.tag == 1 {
                self.password = textField.text
            }
        }
    //нажатие на кнопку return на клавиатуре -- можно обработать скрытие клавиатуры
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.forcedHidingKeyboard()
        return true
    }
}

