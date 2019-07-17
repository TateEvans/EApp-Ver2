//
//  AlertController.swift
//  ExperimentApp
//
//  Created by XHQ on 2019/6/14.
//  Copyright © 2019 XHQ. All rights reserved.
//

import UIKit

class AlertContrller {
    
    static func showAlert(_ inViewController: UIViewController, title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        inViewController.present(alert, animated: true, completion: nil)
        
    }
    
}
