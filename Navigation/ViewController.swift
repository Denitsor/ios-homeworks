//
//  ViewController.swift
//  Navigation
//
//  Created by MacBook on 13.07.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "vi"
    }
}

public extension UITextField {

    func addPaddingLeft(_ padding: CGFloat) {
            leftView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: frame.height))
            leftViewMode = .always
        }
}
