//
//  Alert.swift
//  hwk18_PhotoLibrary
//
//  Created by Kyzu on 24.03.22.
//

import UIKit

extension UIAlertController {
    static func customAlert(okAction: @escaping () -> Void) -> UIAlertController {
        let alertController = UIAlertController(title: "This image alredy exists in the secret storage", message: "Do you want to remove it?", preferredStyle: .alert)
        let noButton = UIAlertAction(title: "no", style: .default, handler: nil)
        let yesButton = UIAlertAction(title: "yes", style: .destructive) { _ in
            okAction()
        }
        alertController.addAction(yesButton)
        alertController.addAction(noButton)
        return alertController
    }
    
}
