//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by MacBook on 30.08.2022.
//

import UIKit

protocol ViewModelProtocol {}

protocol Settings: AnyObject {
    func setup(width viewModel: ViewModelProtocol)
}

class PhotosCollectionViewCell: UICollectionViewCell {
    
    struct ViewModel: ViewModelProtocol {
        let image: UIImage?
    }

    private lazy var photoGal: UIImageView = {
        let image = UIImageView()
        image.layer.frame = CGRect(x: .zero, y: .zero, width: 18, height: 12)
        image.tintColor = .black
        image.backgroundColor = .red
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(photoGal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PhotosCollectionViewCell: Settings {
    func setup(width viewModel: ViewModelProtocol) {
        guard let viewModel = viewModel as? ViewModel else { return }
        self.photoGal.image = viewModel.image
        
        NSLayoutConstraint.activate([
            self.photoGal.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.photoGal.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.photoGal.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.photoGal.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
        ])
    }
}
