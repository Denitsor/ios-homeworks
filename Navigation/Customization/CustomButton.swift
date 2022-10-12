//
//  CustomButton.swift
//  Navigation
//
//  Created by MacBook on 11.10.2022.
//

import UIKit

class CustomButton: UIButton {
    
    var activeTap: (() -> Void)?
    
    init (title: String, titleColor: UIColor) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .highlighted)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .systemBlue
        self.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
        self.layer.cornerRadius = 4
        self.layer.shadowOffset = .init(width: 4, height: 4)
        self.layer.shadowRadius = 4
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.7
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonTapped() {
        activeTap?()
        print("Нажатие на кнопку buttonTaped")
    }
}

extension UIButton {
    func addLeftRightPadding(_ padding: CGFloat) {
//        titleEdgeInsets = UIEdgeInsets(top: 0.0, left: -padding, bottom: 0.0, right: -padding)
        contentEdgeInsets = UIEdgeInsets(top: 0.0, left: padding, bottom: 0.0, right: padding)
    }
}
