//
//  LocaleExtension.swift
//  HyperIOSToolbox
//
//  Created by Sinisa Civcic on 30/04/2020.
//

import Foundation

extension Locale {
    
    public static func emojiFlag(regionCode: String) -> String? {
        let code = regionCode.uppercased()
        
        guard Locale.isoRegionCodes.contains(code) else {
            return nil
        }
        
        var flagString = ""
        for s in code.unicodeScalars {
            guard let scalar = UnicodeScalar(127397 + s.value) else {
                continue
            }
            flagString.append(String(scalar))
        }
        return flagString
    }
}
