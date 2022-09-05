//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by MacBook on 29.08.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private lazy var photoCellTitle: UILabel = {
        let lable = UILabel()
        lable.text = "Photos"
        lable.backgroundColor = .clear
        lable.textColor = .black
        lable.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    private lazy var photoCellArrow: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "arrow.right")
        image.layer.frame = CGRect(x: .zero, y: .zero, width: 18, height: 12)
        image.tintColor = .black
        image.backgroundColor = .clear
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // --- 1 возможно это не верно пробовал вывести таким способом 4 картиники
//    private var miniGallery: UICollectionView = {
//        let miniGallery = PhotosViewController()
//        let photoGallery = miniGallery.photoGallery
//        photoGallery.backgroundColor = .black
//        photoGallery.layer.cornerRadius = 6
//        photoGallery.clipsToBounds = true
//        miniGallery.layout.scrollDirection = .horizontal
//        miniGallery.collectionView(photoGallery, numberOfItemsInSection: 4)
//        return photoGallery
//    }()
    // --- 2
    
    private enum Constants {
        static let numberOfItemInLine: CGFloat = 4
    }

    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        // отступы между рядами и ячейками
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    private lazy var photoGallery: UICollectionView = {
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.backgroundColor = .systemBackground
        collView.dataSource = self
        collView.delegate = self
        collView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        collView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotosCollectionViewCell")
        collView.translatesAutoresizingMaskIntoConstraints = false
        return collView
    }()
    
    var dataGallery = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    
    // --- 3
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        self.prepareForReuse()
        self.photoCellTitle.text = nil
//        self.imagePost.image = nil
    }
    
    private func setupView() {
        self.contentView.backgroundColor = .systemBackground
        
        self.contentView.addSubview(photoCellTitle)
        self.contentView.addSubview(photoCellArrow)
//        //--1 collview
//        self.contentView.addSubview(miniGallery)
//        //--2
        self.contentView.addSubview(self.photoGallery)
        // --- 3
        
        NSLayoutConstraint.activate([
            
            self.photoCellTitle.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12),
            self.photoCellTitle.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12),
//            self.photoCellTitle.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12),

            self.photoCellArrow.centerYAnchor.constraint(equalTo: self.photoCellTitle.centerYAnchor),
            self.photoCellArrow.leadingAnchor.constraint(equalTo: self.photoCellTitle.trailingAnchor),
            self.photoCellArrow.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12),
            
            self.photoGallery.topAnchor.constraint(equalTo: self.photoCellTitle.bottomAnchor, constant: 12),
            self.photoGallery.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12),
            self.photoGallery.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12),
            self.photoGallery.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12),
            self.photoGallery.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

extension PhotosTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollectionViewCell", for: indexPath) as? PhotosCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        let data = self.dataGallery[indexPath.item]
        cell.backgroundColor = .systemMint
        cell.layer.cornerRadius = 6
        cell.clipsToBounds = true
        let viewModel = PhotosCollectionViewCell.ViewModel(image: UIImage(named: "\(data)"))
        cell.setup(width: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: self.collectionView.frame.width, height: 200)
        let spacing = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 0
        let insets = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.sectionInset ?? .zero
        
        let neededWidth = collectionView.frame.width - (Constants.numberOfItemInLine - 1) * spacing - insets.left - insets.right
        
        let itemWidth = floor(neededWidth / Constants.numberOfItemInLine) // округляем
        return CGSize(width: itemWidth, height: itemWidth)
    }
}
