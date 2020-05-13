//
//  NibReusable.swift
//  HyperIOSToolbox
//
//  Created by Sinisa on 06/05/2020.
//

import Foundation


public protocol NibReusable: Reusable {
    static var nib: UINib { get }
}

public extension NibReusable {
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}
