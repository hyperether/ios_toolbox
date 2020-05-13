//
//  Languages.swift
//  HyperIOSToolbox
//
//  Created by Milan Vidovic on 26/03/2020.
//  Copyright © 2020 hyperether. All rights reserved.
//

import Foundation


public protocol Languages {
    func doTranslation()
}
public extension Languages {

    func doTranslation(_ string: String?) -> String? {
        guard let term = string, term.hasPrefix("@") else {
            return string
        }
        let keyForLocalizedString = String(term.dropFirst())
        guard !term.hasPrefix("@@") else {
            return keyForLocalizedString
        }
        return NSLocalizedString(keyForLocalizedString, comment: "")
    }
    func doTranslation(_ string: String?, _ setter: (String?) -> Void) {
        setter(self.doTranslation(string))
    }


    func doTranslation(_ getter: (UIControl.State) -> String?, _ setter: (String?, UIControl.State) -> Void) {
        setter(self.doTranslation(getter(.normal)), .normal)
        setter(self.doTranslation(getter(.selected)), .selected)
        setter(self.doTranslation(getter(.highlighted)), .highlighted)
        setter(self.doTranslation(getter(.disabled)), .disabled)
        setter(self.doTranslation(getter(.focused)), .focused)
        setter(self.doTranslation(getter(.application)), .application)
        setter(self.doTranslation(getter(.reserved)), .reserved)
    }
}
extension UIView: Languages {
    @objc public func doTranslation() {
        self.subviews.forEach { $0.doTranslation() }
    }
}
public extension UILabel {
    override func doTranslation() {
        super.doTranslation()
        self.doTranslation(self.text) { self.text = $0 }
    }
}
public extension UITextView {
    override func doTranslation() {
        super.doTranslation()
        self.doTranslation(self.text) { self.text = $0 }
    }
}
public extension UIButton {
    override func doTranslation() {
        super.doTranslation()
        self.doTranslation(title(for:), setTitle(_:for:))
    }
}
extension UIBarItem: Languages {
    @objc public func doTranslation() {
        self.doTranslation(self.title) { self.title = $0 }
    }
}
public extension UIBarButtonItem {
    override func doTranslation() {
        super.doTranslation()
        self.customView?.doTranslation()
    }
}
public extension UITextField {
    override func doTranslation() {
        super.doTranslation()
        self.doTranslation(self.placeholder) { self.placeholder = $0 }
    }
}
extension UINavigationItem: Languages {
    public func doTranslation() {
        self.doTranslation(self.title) { self.title = $0 }
        self.doTranslation(self.prompt) { self.prompt = $0 }
        self.titleView?.doTranslation()
        self.leftBarButtonItems?.forEach { $0.doTranslation() }
        self.rightBarButtonItems?.forEach { $0.doTranslation() }
    }
}
extension UIViewController: Languages {
    @objc public func doTranslation() {
        self.doTranslation(self.title) { self.title = $0 }
        self.navigationItem.doTranslation()
        self.tabBarItem?.doTranslation()
        self.view.doTranslation()
    }
}
