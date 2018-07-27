//
//  ExViewController.swift
//  ABC
//
//  Created by SotheaNem on 7/26/18.
//  Copyright © 2018 Sothea. All rights reserved.
//

import UIKit

extension UIViewController {
    func alertMessageWithoutAction(title: String?, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        alert.addAction(okBtn)
        present(alert, animated: true)
    }
    
    func alertMessageWithAction(title: String?, message: String, action: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "cancel", style: .cancel, handler: action)
        alert.addAction(okBtn)
        present(alert, animated: true)
    }
}
