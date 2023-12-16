//
//  Alert.swift
//  MyPets2
//
//  Created by Caio Fabrini on 16/12/23.
//

import Foundation
import UIKit

struct AlertAction {
    let title: String
    let style: UIAlertAction.Style
    let handler: ((UIAlertAction) -> Void)?
}

class AlertController {
    
    static func show(in viewController: UIViewController, title: String?, message: String?, actions: [AlertAction] = []) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if actions.isEmpty {
            let okButton = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(okButton)
        } else {
            for action in actions {
                let alertAction = UIAlertAction(title: action.title, style: action.style, handler: action.handler)
                alertController.addAction(alertAction)
            }
        }
        
        viewController.present(alertController, animated: true)
    }
    
    
}
