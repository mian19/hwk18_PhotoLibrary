//
//  UIButton+customButton.swift
//  hwk18_PhotoLibrary
//
//  Created by Kyzu on 22.03.22.
//

import Foundation
import UIKit

extension UIButton {
    static func customButton(title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "Arial-BoldMT" , size: 20)
        
        return button
    }
}
