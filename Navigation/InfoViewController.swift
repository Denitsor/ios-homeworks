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
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.view.addSubview(self.button)
        self.button.frame = CGRect(x: 30, y: 120, width: 350, height: 50)
        
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
