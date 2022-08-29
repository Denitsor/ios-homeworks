//
//  ProfileTableHeaderView.swift
//  Navigation
//
//  Created by MacBook on 18.08.2022.
//

import UIKit

class ProfileTableHeaderView: UITableViewHeaderFooterView {

        private lazy var profileHeaderView: ProfileHeaderView = {
            let profileHeaderView = ProfileHeaderView()
            profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
            return profileHeaderView
        }()
    
    override init (reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addSubview(self.profileHeaderView)
        self.setupViewHeaderProfile()
    }

    private func setupViewHeaderProfile() {

            NSLayoutConstraint.activate([
                self.profileHeaderView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                self.profileHeaderView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                self.profileHeaderView.topAnchor.constraint(equalTo: self.topAnchor),
                self.profileHeaderView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
        }
      
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
