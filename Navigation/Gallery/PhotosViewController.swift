//
//  PhotosViewController.swift
//  Navigation
//
//  Created by MacBook on 30.08.2022.
//

import UIKit
import iOSIntPackage

class PhotosViewController: UIViewController {
    
    let imagePublisherFacade = ImagePublisherFacade()
    var dataGallery: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20"]
    var dataGallery2: [UIImage] = []
    
    func addImagesGallery2() {
        for item in dataGallery {
            dataGallery2.append(UIImage(named: "\(item)")!)
//            print(item)
        }
    }
    
    private enum Constants {
        static let numberOfItemInLine: CGFloat = 3
    }
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.scrollDirection = .vertical
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "Photo Gallery"
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(self.photoGallery)
        setupView()
        addImagesGallery2()
        imagePublisherFacade.subscribe(self)
        imagePublisherFacade.addImagesWithTimer(time: 0.6, repeat: dataGallery2.count, userImages: dataGallery2)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.navigationBar.isHidden = true
        imagePublisherFacade.removeSubscription(for: self)
    }
    
    private func setupView() {
        NSLayoutConstraint.activate([
            self.photoGallery.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.photoGallery.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.photoGallery.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.photoGallery.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }

}
extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataGallery2.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollectionViewCell", for: indexPath) as? PhotosCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
//        let data = self.dataGallery[indexPath.item]
        cell.backgroundColor = .systemMint
//        let viewModel = PhotosCollectionViewCell.ViewModel(image: UIImage(named: "\(data)"))
//        cell.setup(width: viewModel)
        cell.photoGal.image = self.dataGallery2[indexPath.row]
        cell.setup2()
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
extension PhotosViewController: ImageLibrarySubscriber {
    func receive(images: [UIImage]) {
        dataGallery2 = images
        photoGallery.reloadData()
    }
}
