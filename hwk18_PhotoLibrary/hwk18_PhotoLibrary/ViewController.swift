//
//  ViewController.swift
//  hwk18_PhotoLibrary
//
//  Created by Kyzu on 22.03.22.
//

//Библиотека хранения фото с паролем. Для начала на первом экране сделать
//2 кнопки, добавить фото и просмотр всех фото. По добавлению фото,
//отображать imagePickerController и добавлять фото в массив. Отображение
//фото выполняться будет чуть позже, будет использоваться UICollectionView

import UIKit

class ViewController: UIViewController {
    
    private var addPhotoButton: UIButton!
    private var showPhotoButton: UIButton!
    private var dictionaryOfSecretImages: [URL : UIImage] = [:]
    
    override func loadView() {
        super.loadView()
        
        addPhotoButton = UIButton.customButton(title: "add photos")
        showPhotoButton = UIButton.customButton(title: "show photos")
        
        view.addSubview(addPhotoButton)
        view.addSubview(showPhotoButton)
        setButtonsOnScreen()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPhotoButton.addTarget(self, action: #selector(onAddPhotoButton), for: .touchUpInside)
    }
    
    private func setButtonsOnScreen() {
        NSLayoutConstraint.activate([
            addPhotoButton.widthAnchor.constraint(equalToConstant: 150),
            addPhotoButton.heightAnchor.constraint(equalToConstant: 50),
            addPhotoButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            addPhotoButton.topAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 50),
            
            showPhotoButton.widthAnchor.constraint(equalTo: addPhotoButton.widthAnchor),
            showPhotoButton.heightAnchor.constraint(equalTo: addPhotoButton.heightAnchor),
            showPhotoButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            showPhotoButton.topAnchor.constraint(equalTo: addPhotoButton.bottomAnchor, constant: 20)
        ])
    }
    
    @objc func onAddPhotoButton() {
        let imageController = UIImagePickerController()
        imageController.sourceType = .photoLibrary
        imageController.delegate = self
        present(imageController, animated: true, completion: nil)
    }
}

extension ViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let imageURL = info[.referenceURL] as! URL
        let image = info[.originalImage] as! UIImage
        
        if dictionaryOfSecretImages.keys.contains(imageURL) {
            let removeImageFromDictionary = {
                self.dictionaryOfSecretImages[imageURL] = nil
            }
            let alert = UIAlertController.customAlert(okAction: removeImageFromDictionary)
            picker.present(alert, animated: true, completion: .none)
        } else {
            dictionaryOfSecretImages[imageURL] = image
        }
    }
}

