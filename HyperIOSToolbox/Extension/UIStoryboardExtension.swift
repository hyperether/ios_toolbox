//
//  UIStoryboardExtension.swift
//  HyperIOSToolbox
//
//  Created by Sinisa on 09/04/2020.
//

import Foundation

public extension UIStoryboard {
    
    class func instantiateViewController <T: UIViewController>(_ type: T.Type, storyboardIdentifier: String = "Main") -> T? {
        let storyboard = UIStoryboard(name: storyboardIdentifier, bundle: nil)
        return storyboard.instantiateViewController(type)
    }

    func instantiateViewController <T: UIViewController>(_ type: T.Type) -> T? {
        return instantiateViewController(withIdentifier: String(describing: type)) as? T
    }
}
