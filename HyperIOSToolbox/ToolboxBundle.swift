//
//  ToolboxBundle.swift
//  toolbox
//
//  Created by Nebojsa Brankovic on 21/11/2018.
//  Copyright © 2018 hyperether. All rights reserved.
//

import Foundation

public extension Bundle {
    
    class func toolboxBundle() -> Bundle {
        let assetPath = Bundle(for: self).resourcePath!
        return Bundle(path: NSString(string: assetPath).appendingPathComponent("HyperIOSToolbox.bundle"))!
    }
}
