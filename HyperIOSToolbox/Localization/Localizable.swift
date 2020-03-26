//
//  Localizable.swift
//  HyperIOSToolbox
//
//  Created by Milan Vidovic on 26/03/2020.
//  Copyright © 2020 hyperether. All rights reserved.
//

import Foundation


public protocol Localizable {
    func localize()
}
public extension Localizable {
    func localize(_ string: String?) -> String? {
        guard let term = string, term.hasPrefix("@") else {
            return string
        }
        let keyForLocalizedString = String(term.dropFirst())
        guard !term.hasPrefix("@@") else {
            return keyForLocalizedString
        }
        return NSLocalizedString(keyForLocalizedString, comment: "")
    }
    func localize(_ string: String?, _ setter: (String?) -> Void) {
        setter(self.localize(string))
    }
    func localize(_ getter: (UIControl.State) -> String?, _ setter: (String?, UIControl.State) -> Void) {
        setter(self.localize(getter(.normal)), .normal)
        setter(self.localize(getter(.selected)), .selected)
        setter(self.localize(getter(.highlighted)), .highlighted)
        setter(self.localize(getter(.disabled)), .disabled)
        setter(self.localize(getter(.focused)), .focused)
        setter(self.localize(getter(.application)), .application)
        setter(self.localize(getter(.reserved)), .reserved)
    }
}
extension UIView: Localizable {
    @objc public func localize() {
        self.subviews.forEach { $0.localize() }
    }
}
public extension UILabel {
    override func localize() {
        super.localize()
        self.localize(self.text) { self.text = $0 }
    }
}
public extension UITextView {
    override func localize() {
        super.localize()
        self.localize(self.text) { self.text = $0 }
    }
}
public extension UIButton {
    override func localize() {
        super.localize()
        self.localize(title(for:), setTitle(_:for:))
    }
}
extension UIBarItem: Localizable {
    @objc public func localize() {
        self.localize(self.title) { self.title = $0 }
    }
}
public extension UIBarButtonItem {
    override func localize() {
        super.localize()
        self.customView?.localize()
    }
}
public extension UITextField {
    override func localize() {
        super.localize()
        self.localize(self.placeholder) { self.placeholder = $0 }
    }
}
extension UINavigationItem: Localizable {
    public func localize() {
        self.localize(self.title) { self.title = $0 }
        self.localize(self.prompt) { self.prompt = $0 }
        self.titleView?.localize()
        self.leftBarButtonItems?.forEach { $0.localize() }
        self.rightBarButtonItems?.forEach { $0.localize() }
    }
}
extension UIViewController: Localizable {
    @objc public func localize() {
        self.localize(self.title) { self.title = $0 }
        self.navigationItem.localize()
        self.tabBarItem?.localize()
        self.view.localize()
    }
}
