//
//  ProfileViewController.swift
//  Navigation
//
//  Created by MacBook on 13.07.2022.
//

import UIKit
import StorageService

class ProfileViewController: UIViewController {
    
    var currentUser: User
    
    init(currentUser: User) {
        self.currentUser = currentUser
        print("pvc", currentUser.userLogin, currentUser.userName, currentUser.userStatus)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostCell")
        tableView.register(ProfileTableHeaderView.self, forHeaderFooterViewReuseIdentifier: "ProfileTableHeaderView")
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotoTableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
        
    private lazy var posts: [Post] = []
    
    private lazy var profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(tableView)
        self.injectDataProfileTableView()
        self.setupViewProfile()
        self.posts = PostsArray.shared.data
        self.tableView.reloadData()
        self.navigationController?.navigationBar.isHidden = true
        
    }
    private func injectDataProfileTableView() {
        profileHeaderView.addDataUserProfile(userStatus: currentUser.userStatus,
                                             userName: currentUser.userName,
                                             avatarImage: currentUser.userAvatar)
    }
    private func setupViewProfile() {
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
  
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.tableView.frame = self.view.bounds
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return self.posts.count
        }
        return 1
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return tableView.dequeueReusableHeaderFooterView(withIdentifier: "ProfileTableHeaderView")
        }
        return nil
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print(indexPath)
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoTableViewCell", for: indexPath) as? PhotosTableViewCell else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
                return cell
            }
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostTableViewCell else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        let post = self.posts[indexPath.row]
        cell.setup(width: post)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
            guard indexPath == [0, 0] else { return }
            let PhotosVC = PhotosViewController()
            navigationController?.pushViewController(PhotosVC, animated: true)
    }
}
