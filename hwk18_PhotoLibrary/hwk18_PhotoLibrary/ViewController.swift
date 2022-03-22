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
    
    
}

