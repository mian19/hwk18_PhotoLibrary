//
//  ViewController.swift
//  hwk18_PhotoLibrary
//
//  Created by Kyzu on 22.03.22.
//

import UIKit

class ViewController: UIViewController {
    
    private var addPhotoButton: UIButton!
    private var showPhotoButton: UIButton!
    private var secretPasswordView: UIView!
    private var blurEffectView: UIVisualEffectView!
    private var arrForPicker = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
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
        showPhotoButton.addTarget(self, action: #selector(onShowPhotoButton), for: .touchUpInside)
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
    
    @objc func onShowPhotoButton() {
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterialDark)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        view.addSubview(blurEffectView)
        secretPasswordView = UIView.viewForPassword(pickerDelegate: self)
        
        view.addSubview(secretPasswordView)
        secretPasswordView.center = view.center
        let tapOnBlur = UITapGestureRecognizer(target: self, action: #selector(onBlurEffectView))
        blurEffectView.addGestureRecognizer(tapOnBlur)
    }
    
    @objc func onBlurEffectView() {
        blurEffectView.removeFromSuperview()
        secretPasswordView.removeFromSuperview()
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

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        arrForPicker.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        String(arrForPicker[row])
      
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        var color = UIColor.white
        if row == pickerView.selectedRow(inComponent: component) {
            color = .green
        }
      return  NSAttributedString(string: String(arrForPicker[row]), attributes: [.foregroundColor : color])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.reloadAllComponents()
        if pickerView.selectedRow(inComponent: 0) == 1 && pickerView.selectedRow(inComponent: 1) == 2 && pickerView.selectedRow(inComponent: 2) == 3 {
            openPhotoView()
            onBlurEffectView()
        }
    }
    
    private func openPhotoView() {
        let storyboard = UIStoryboard(name: "photoCollectionVC", bundle: Bundle.main)
        let viewCollectionVC = storyboard.instantiateInitialViewController() as! photoCollectionVC
        viewCollectionVC.setPhotoArray(photos: Array(dictionaryOfSecretImages.values))
        self.present(viewCollectionVC, animated: true)
    }
    
    
        
    
}

