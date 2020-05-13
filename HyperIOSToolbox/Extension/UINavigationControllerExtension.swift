//
//  UINavigationControllerExtension.swift
//  HyperIOSToolbox
//
//  Created by Sinisa on 21/04/2020.
//

import Foundation

public extension UINavigationController {

    func popViewController(animated: Bool = true, _ completion: (() -> Void)? = nil) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        popViewController(animated: animated)
        CATransaction.commit()
    }

    func pushViewController(_ viewController: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }
}
