//
//  PostViewController.swift
//  Navigation
//
//  Created by MacBook on 14.07.2022.
//

import UIKit
import StorageService

class PostViewController: UIViewController {

    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Feeds test"//post?.postTitle
        self.view.backgroundColor = .lightGray
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.up.and.person.rectangle.portrait"), style: .plain, target: self, action: #selector(rightHandAction))
    }
    
    @objc private func rightHandAction() {
        let infoView = InfoViewController()
//        self.navigationController?.pushViewController(infoView, animated: true)
        self.present(infoView, animated: true, completion: nil)
    }

}
