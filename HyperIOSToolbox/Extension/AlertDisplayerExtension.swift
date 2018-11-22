//
//  AlertDisplayerExtension.swift
//  HyperIOSToolbox
//
//  Created by nikola on 11/21/18.
//  Copyright © 2018 hyperether. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    // Show error message.
    open func showError(message : String?) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: NSLocalizedString("alert.error.title", bundle: Bundle.toolboxBundle(),   comment: ""), message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: NSLocalizedString("alert.ok.action", bundle: Bundle.toolboxBundle(), comment: ""), style: .default, handler: nil)
            alertController.addAction(action)
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    // Show alert message with action on OK button.
    open func showAlert(message : String, in viewController: UIViewController, handler : ((_ success: Bool) -> Void)? = nil) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: NSLocalizedString("alert.title", bundle: Bundle.toolboxBundle(),   comment: ""), message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: NSLocalizedString("alert.ok.action", bundle: Bundle.toolboxBundle(),   comment: ""), style: .default){ (alertAction) -> Void in
                if(handler != nil){
                    handler!(true)
                }
            }
            alertController.addAction(action)
            
            viewController.present(alertController, animated: true, completion: nil)
        }
    }
    
    // Show message with action on OK button.
    open func showMessage(message : String, in viewController: UIViewController, handler : ((_ success: Bool) -> Void)?) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: NSLocalizedString("alert.ok.action", bundle: Bundle.toolboxBundle(),    comment: ""), style: .default){ (alertAction) -> Void in
                if(handler != nil){
                    handler!(true)
                }
            }
            alertController.addAction(action)
            
            viewController.present(alertController, animated: true, completion: nil)
        }
    }
    
    // Show dialog wit actions on YES and NO button.
    open func showDialog(title: String?, message : String, in viewController: UIViewController, handler : ((_ success: Bool) -> Void)?) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let actionYes = UIAlertAction(title: NSLocalizedString("alert.yes.action", bundle: Bundle.toolboxBundle(),   comment: ""), style: .default){ (alertAction) -> Void in
                if(handler != nil){
                    handler!(true)
                }
            }
            
            let actionNo = UIAlertAction(title: NSLocalizedString("alert.no.action", bundle: Bundle.toolboxBundle(),   comment: ""), style: .default){ (alertAction) -> Void in
                if(handler != nil){
                    handler!(false)
                }
            }
            alertController.addAction(actionYes)
            alertController.addAction(actionNo)
            
            viewController.present(alertController, animated: true, completion: nil)
        }
    }
    
    // Will show a prompt to bring user into system settings.
    open func showPromptForSystemSettings(title: String, actionTitle: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: actionTitle, style: .default, handler: { (action: UIAlertAction) -> Void in
            let appSettings = URL(string: UIApplication.openSettingsURLString)
            UIApplication.shared.open(appSettings!, options: [:], completionHandler: nil)
        })
        let cancelAction = UIAlertAction(title: NSLocalizedString("alert.cancel.action", bundle: Bundle.toolboxBundle(),   comment: ""), style: .cancel, handler: nil)
        alert.addAction(settingsAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    // Show destructive prompt.
    open func showDestructivePrompt(title: String?, buttonTitle: String, handler: @escaping ((_ action: UIAlertAction) -> ())) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        let destroyAction = UIAlertAction(title: buttonTitle, style: .destructive, handler: handler)
        let cancelAction = UIAlertAction(title: NSLocalizedString("alert.cancel.action", bundle: Bundle.toolboxBundle(),   comment: ""), style: .cancel, handler: nil)
        alert.addAction(destroyAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
}
