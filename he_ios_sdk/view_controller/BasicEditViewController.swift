//
//  BasicEditViewController.swift
//  he_ios_sdk
//
//  Created by nikola on 11/19/18.
//  Copyright © 2018 hyperether. All rights reserved.
//

import Foundation
import UIKit

open class BasicEditViewController: UIViewController, UITextFieldDelegate, UISearchBarDelegate {

    var filedLastY : CGFloat = 0
    var orginY : CGFloat = 0
    
    override open func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(BasicEditViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BasicEditViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        filedLastY = 0
        orginY = self.view.frame.origin.y
        
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    open func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }
    
   open func textFieldDidBeginEditing(_ textField: UITextField){
        let barHeight = self.navigationController?.navigationBar.frame.height ?? 0
        let topOfBar = self.navigationController?.navigationBar.frame.origin.y ?? 0
        print(" ne znam \((textField.superview?.convert(textField.frame.origin, to: self.view).y)!)")
        filedLastY =  self.view.frame.size.height - (textField.superview?.convert(textField.frame.origin, to: self.view).y)! - barHeight - textField.frame.size.height - topOfBar
        print("view height = \(self.view.frame.size.height)   field y is on = \(textField.frame.origin.y)  bar height = \(barHeight) field height = \(textField.frame.size.height) \n textfiled is on = \(filedLastY)")
    }
    
    open func searchBarTextDidBeginEditing(_ searchBar: UISearchBar){
        let barHeight = self.navigationController?.navigationBar.frame.height ?? 0
        let topOfBar = self.navigationController?.navigationBar.frame.origin.y ?? 0
        print(" ne znam \((searchBar.superview?.convert(searchBar.frame.origin, to: self.view).y)!)")
        filedLastY =  self.view.frame.size.height - (searchBar.superview?.convert(searchBar.frame.origin, to: self.view).y)! - barHeight - searchBar.frame.size.height - topOfBar
        print("view height = \(self.view.frame.size.height)   field y is on = \(searchBar.frame.origin.y)  bar height = \(barHeight) field height = \(searchBar.frame.size.height) \n textfiled is on = \(filedLastY)")
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            print("keyboardSize \(keyboardSize.height)   textfiled is on = \(filedLastY) orgin y is = \(self.view.frame.origin.y)")
            if filedLastY < keyboardSize.height{
                self.view.frame.origin.y = orginY
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != orginY{
            self.view.frame.origin.y = orginY
        }
    }

}

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
}

