//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by MacBook on 19.08.2022.
//

import UIKit
import StorageService

class PostTableViewCell: UITableViewCell {
    
    private lazy var authorPost: UILabel = {
        let lable = UILabel()
        lable.backgroundColor = .clear
        lable.numberOfLines = 0
        lable.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        lable.textColor = .black
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    private lazy var imagePost: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var descriptionPost: UILabel = {
        let descLable = UILabel()
        descLable.backgroundColor = .clear
        descLable.numberOfLines = 0
        descLable.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        descLable.textColor = .systemGray
        descLable.translatesAutoresizingMaskIntoConstraints = false
        return descLable
    }()
    
    private lazy var likesPost: UILabel = {
        let likes = UILabel()
        likes.backgroundColor = .clear
        likes.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        likes.textColor = .black
        likes.text = "Likes:"
        likes.translatesAutoresizingMaskIntoConstraints = false
        return likes
    }()
    
    private lazy var viewsPost: UILabel = {
        let views = UILabel()
        views.backgroundColor = .clear
        views.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        views.textAlignment = .right
        views.text = "Views:"
        views.textColor = .black
        views.translatesAutoresizingMaskIntoConstraints = false
        return views
    }()
    
    func setup(width posts: Post) {
        self.authorPost.text = posts.author
        self.imagePost.image = UIImage(named: "\(posts.image)")
        self.descriptionPost.text = posts.description
        self.likesPost.text = "Likes: \(posts.likes)"
        self.viewsPost.text = "Views: \(posts.views)"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        self.prepareForReuse()
        self.authorPost.text = nil
        self.imagePost.image = nil
        self.descriptionPost.text = nil
        self.likesPost.text = nil
        self.viewsPost.text = nil
    }
    
    private func setupView() {
        self.contentView.backgroundColor = .white
        
        self.contentView.addSubview(self.authorPost)
        self.contentView.addSubview(self.imagePost)
        self.contentView.addSubview(self.descriptionPost)
        self.contentView.addSubview(self.likesPost)
        self.contentView.addSubview(self.viewsPost)
        
        NSLayoutConstraint.activate([
            
            self.authorPost.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            self.authorPost.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.authorPost.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),

            self.imagePost.topAnchor.constraint(equalTo: self.authorPost.bottomAnchor, constant: 12),
            self.imagePost.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.imagePost.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.imagePost.heightAnchor.constraint(equalTo: self.imagePost.widthAnchor),
            
            self.descriptionPost.topAnchor.constraint(equalTo: self.imagePost.bottomAnchor, constant: 16),
            self.descriptionPost.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.descriptionPost.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            
            self.likesPost.topAnchor.constraint(equalTo: self.descriptionPost.bottomAnchor, constant: 16),
            self.likesPost.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.likesPost.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16),
            
            self.viewsPost.topAnchor.constraint(equalTo: self.descriptionPost.bottomAnchor, constant: 16),
            self.viewsPost.leadingAnchor.constraint(equalTo: self.likesPost.trailingAnchor),
            self.viewsPost.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            self.viewsPost.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16)
            
        ])
    }
}
