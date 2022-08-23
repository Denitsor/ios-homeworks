//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by MacBook on 19.08.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    private lazy var postContentStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
//        stackView.distribution = .fillProportionally
//        stackView.alignment = .fill
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var postFooterStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
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
//        imageView.image = UIImage(named: "\(posts.image)")
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
        
        self.contentView.addSubview(self.postContentStack)
        self.contentView.addSubview(self.postFooterStack)
        self.postContentStack.addArrangedSubview(self.authorPost)
        self.postContentStack.addArrangedSubview(self.imagePost)
        self.postContentStack.addArrangedSubview(self.descriptionPost)
        self.postFooterStack.addArrangedSubview(self.likesPost)
        self.postFooterStack.addArrangedSubview(self.viewsPost)
        
        NSLayoutConstraint.activate([
            self.postContentStack.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            self.postContentStack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.postContentStack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            
//            self.authorPost.topAnchor.constraint(equalTo: self.postContentStack.topAnchor),
//            self.authorPost.bottomAnchor.constraint(equalTo: self.postContentStack.bottomAnchor, constant: 0),

//            self.imagePost.topAnchor.constraint(equalTo: self.authorPost.bottomAnchor),
//            self.imagePost.leadingAnchor.constraint(equalTo: self.postContentStack.leadingAnchor),
//            self.imagePost.trailingAnchor.constraint(equalTo: self.postContentStack.trailingAnchor),
            
//            self.descriptionPost.topAnchor.constraint(equalTo: self.imagePost.bottomAnchor, constant: 16),
//            self.descriptionPost.leadingAnchor.constraint(equalTo: self.postContentStack.leadingAnchor, constant: 16),
            
            self.postFooterStack.topAnchor.constraint(equalTo: self.postContentStack.bottomAnchor, constant: 16),
            self.postFooterStack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.postFooterStack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            self.postFooterStack.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16)
        ])
    }
}
