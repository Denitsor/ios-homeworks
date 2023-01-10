//
//  InfoViewController.swift
//  Navigation
//
//  Created by MacBook on 14.07.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemRed
        button.setTitle("Открыть алерт", for: .normal)
        button.addTarget(self, action: #selector(self.didAlertButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var infoModelLabel: UILabel = {
        let label = UILabel()
//        label.text = "Label"
        label.textAlignment = .center
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var planetRotationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getRandomTitle { infoModel in
            DispatchQueue.main.async {
                if let infoModel {
                    self.infoModelLabel.text = infoModel.title
                } else {
                    self.infoModelLabel.text = "Something went wrong..."
                }
            }
        }
        getRotationPeriod { planetModel in
            DispatchQueue.main.async {
                if let planetModel {
                    self.planetRotationLabel.text = planetModel.rotationPeriod
                } else {
                    self.planetRotationLabel.text = "Данные не найдены"
                }
            }
            
        }
        setupInfoView()
    }
    
    func setupInfoView() {
        self.view.backgroundColor = .white
        self.view.addSubview(self.button)
        self.view.addSubview(self.infoModelLabel)
        self.view.addSubview(self.planetRotationLabel)
        //        self.button.frame = CGRect(x: 30, y: 120, width: 350, height: 50)
        
        NSLayoutConstraint.activate([
            self.button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            self.button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            self.button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            self.button.heightAnchor.constraint(equalToConstant: 50),
            
            self.infoModelLabel.topAnchor.constraint(equalTo: self.button.bottomAnchor, constant: 16),
            self.infoModelLabel.leadingAnchor.constraint(equalTo: self.button.leadingAnchor, constant: 16),
            self.infoModelLabel.trailingAnchor.constraint(equalTo: self.button.trailingAnchor, constant: -16),
            
            self.planetRotationLabel.topAnchor.constraint(equalTo: self.infoModelLabel.bottomAnchor, constant: 16),
            self.planetRotationLabel.leadingAnchor.constraint(equalTo: self.button.leadingAnchor, constant: 16),
            self.planetRotationLabel.trailingAnchor.constraint(equalTo: self.button.trailingAnchor, constant: -16)
            
        ])
    }
    
    
    @objc private func didAlertButton() {
        let alert = UIAlertController(title: "Заголовок алерта", message: "сообщение алерта", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Да", style: .default, handler: { action in
            print("положительный ответ")
        }))
        alert.addAction(UIAlertAction(title: "Нет", style: .cancel, handler: { action in
            print("отрицательный ответ")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
