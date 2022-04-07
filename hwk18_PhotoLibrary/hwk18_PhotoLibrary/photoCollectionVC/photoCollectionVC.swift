//
//  photoViewController.swift
//  hwk18_PhotoLibrary
//
//  Created by Kyzu on 7.04.22.
//

import Foundation
import UIKit

class photoCollectionVC: UIViewController{
    
    private var secretImages: [UIImage]?
    private var collectionView: UICollectionView!
    private var imageView: UIImageView!
    private var layoutForCollectionView: UICollectionViewFlowLayout!
    
    override func loadView() {
        super.loadView()
        layoutSettings()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layoutForCollectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .cyan
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.reuseID)
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemYellow
        
        view.addSubview(collectionView)
        view.addSubview(imageView)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setElements()
    }
    
    private func layoutSettings() {
        layoutForCollectionView = UICollectionViewFlowLayout()
        layoutForCollectionView.scrollDirection = .horizontal
        layoutForCollectionView.itemSize = CGSize(width: view.bounds.height * 0.15, height: view.bounds.height * 0.15)
        layoutForCollectionView.sectionInset = UIEdgeInsets(top: 15, left: 25, bottom: 15, right: 25)
    }
    
    private func setElements() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            imageView.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.65),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            view.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 50),
            collectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.2)
        ])
    }
    
    func setPhotoArray(photos: [UIImage]?) {
        secretImages = photos
    }
}

extension photoCollectionVC: UICollectionViewDelegate& UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return secretImages?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.reuseID, for: indexPath) as! PhotoCollectionViewCell
        
        cell.putImageToCell(image: secretImages?[indexPath.row] ?? UIImage())
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        imageView.image = secretImages?[indexPath.row] ?? UIImage()
    }
    
}
