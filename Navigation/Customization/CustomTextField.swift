//
//  CustomTextField.swift
//  Navigation
//
//  Created by MacBook on 18.10.2022.
//

import UIKit

public extension UITextField {

    func addPaddingLeft(_ padding: CGFloat) {
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: frame.height))
        leftViewMode = .always
    }
}
