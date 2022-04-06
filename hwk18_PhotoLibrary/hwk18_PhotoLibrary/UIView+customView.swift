//
//  UIView+customView.swift
//  hwk18_PhotoLibrary
//
//  Created by Kyzu on 6.04.22.
//

import Foundation
import UIKit

extension UIView {
    
    static func viewForPassword() -> UIView {
        let view = UIView()
        view.frame.size = CGSize(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.3)
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        
        return view
    }
    
}
