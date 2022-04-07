//
//  UIView+customView.swift
//  hwk18_PhotoLibrary
//
//  Created by Kyzu on 6.04.22.
//

import Foundation
import UIKit

extension UIView {
    static func viewForPassword(pickerDelegate: UIViewController) -> UIView {
        let view = UIView()
        let label = UILabel()
        let secretCodePicker = UIPickerView()
        
        view.frame.size = CGSize(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.3)
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        
        label.text = "Enter Password (123)"
        label.frame = CGRect(x: view.bounds.minX, y: view.bounds.minY, width: view.bounds.width, height: view.bounds.height * 0.2)
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20.0)
        
        secretCodePicker.frame = CGRect(x: view.bounds.minX, y: label.frame.maxY, width: view.bounds.width, height: view.bounds.height * 0.6)
        secretCodePicker.delegate = pickerDelegate as? UIPickerViewDelegate
        secretCodePicker.dataSource = pickerDelegate as? UIPickerViewDataSource
        
        view.addSubview(label)
        view.addSubview(secretCodePicker)
        
        return view
    }
    
}
