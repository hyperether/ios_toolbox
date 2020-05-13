//
//  CALayerExtension.swift
//  HyperIOSToolbox
//
//  Created by Sinisa on 09/04/2020.
//

import Foundation

extension CALayer {
    
    var UIBorderColor: UIColor {
        set {
            borderColor = newValue.cgColor
        }
        get {
            return UIColor(cgColor: borderColor!)
        }
    }
    
    var UIShadowColor: UIColor {
        set {
            shadowColor = newValue.cgColor
        }
        get {
            return UIColor(cgColor: shadowColor!)
        }
    }
    
    func addShadow(withColor color: UIColor = .black, radius: CGFloat = 5, opacity: Float = 1, offsetX: CGFloat = 0, offsetY: CGFloat = 1, customPath: CGPath? = nil) {
        shadowColor = color.cgColor
        shadowOffset = CGSize(width: offsetX, height: offsetY)
        shadowRadius = radius
        shadowOpacity = opacity
        shadowPath = customPath
        masksToBounds = false
    }
}
