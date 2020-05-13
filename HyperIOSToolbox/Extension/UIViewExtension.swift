//
//  UIViewExtension.swift
//  HyperIOSToolbox
//
//  Created by Sinisa on 02/04/2020.
//

import Foundation
import UIKit

public extension UIView {
    
    func addBorder(color: UIColor = .black, weight: CGFloat = 1.0) {
        layer.borderColor = color.cgColor
        layer.borderWidth = weight
    }
    
    func addRoundBorders(_ cornerRadius: CGFloat = 10.0) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
    }
    
    func addRoundCorner(_ corners: CACornerMask, cornerRadius: CGFloat = 10.0) {
        clipsToBounds = true
        layer.maskedCorners = corners
        layer.cornerRadius = cornerRadius
    }
    
    func addShadow(color: UIColor = .black, radius: CGFloat = 5, opacity: Float = 1, offsetX: CGFloat = 0, offsetY: CGFloat = 1, customPath: CGPath? = nil) {
        layer.addShadow(withColor: color, radius: radius, opacity: opacity, offsetX: offsetX, offsetY: offsetY, customPath: customPath)
        clipsToBounds = false
    }
    
    func addTapGestureRecognizer(target: AnyObject, action: Selector, tapNumber: Int = 1) {
        let tapGesture = UITapGestureRecognizer(target: target, action: action)
        tapGesture.numberOfTapsRequired = tapNumber
        tapGesture.cancelsTouchesInView = false
        addGestureRecognizer(tapGesture)
        isUserInteractionEnabled = true
    }
    
    func addSwipeGestureRecognizer(target: AnyObject, direction: UISwipeGestureRecognizer.Direction, action: Selector) {
        let swipeGesture = UISwipeGestureRecognizer(target: target, action: action)
        swipeGesture.direction = direction
        swipeGesture.cancelsTouchesInView = false
        addGestureRecognizer(swipeGesture)
        isUserInteractionEnabled = true
    }
    
    func removeGestureRecognizers() {
        gestureRecognizers?.forEach(removeGestureRecognizer)
    }
    
    func removeGestureRecognizers(_ gestureRecognizers: [UIGestureRecognizer]) {
        for recognizer in gestureRecognizers {
            removeGestureRecognizer(recognizer)
        }
    }
    
    
}
