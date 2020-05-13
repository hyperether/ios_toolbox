//
//  StringExtension.swift
//  HyperIOSToolbox
//
//  Created by Sinisa on 30/04/2020.
//

import Foundation


public extension String {
    
    var isAlphanumericWithNoSpaces: Bool {
        return rangeOfCharacter(from: CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789").inverted) == nil
    }
    
    var hasPunctuationCharacters: Bool {
        return rangeOfCharacter(from: CharacterSet.punctuationCharacters) != nil
    }
    
    var hasNumbers: Bool {
        return rangeOfCharacter(from: CharacterSet(charactersIn: "0123456789")) != nil
    }
    
    var onlyDigits: Bool {
        return rangeOfCharacter(from: CharacterSet(charactersIn: "0123456789")) == range(of: self)
    }
    
    //Checks for zeroes at the beginning
    var nonOctalInteger: Bool {
        let regexp = "[123456789]+\\d*"
        return range(of: regexp, options: .regularExpression) == range(of: self) && !isEmpty
    }
    
    //Regex fulfill RFC 5322 Internet Message format
    var isEmailFormatted: Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", "[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+(\\.[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+)*@([A-Za-z0-9]([A-Za-z0-9-]*[A-Za-z0-9])?\\.)+[A-Za-z0-9]([A-Za-z0-9-]*[A-Za-z0-9])?")
        return predicate.evaluate(with: self)
    }

    
    func htmlToAttributedString(with font: UIFont?) -> NSAttributedString {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            let attrString = try NSMutableAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
            if let font = font {
                var attrs = attrString.attributes(at: 0, effectiveRange: nil)
                attrs[NSAttributedString.Key.font] = font
                attrString.addAttributes(attrs, range: NSRange(location: 0, length: attrString.length))
            }
            return attrString
        } catch {
            return NSAttributedString()
        }
    }
    
    func splitInHalf() -> (String, String) {
        let words = self.components(separatedBy: " ")
        
        let halfLength = words.count / 2 + words.count % 2
        let firstHalf = words[0..<halfLength].joined(separator: " ")
        let secondHalf = words[halfLength..<words.count].joined(separator: " ")
        return (firstHalf, secondHalf)
    }
    
    func separate(every stride: Int = 2, with separator: Character = " ") -> String {
        return String(enumerated().map { $0 > 0 && $0 % stride == 0 ? [separator, $1] : [$1]}.joined())
    }
    
    func replace(target: String, withString: String) -> String {
        return self.replacingOccurrences(of: target, with: withString)
    }
    
    func range(of substring: String) -> NSRange {
        let nsString = self as NSString
        return nsString.range(of: substring)
    }
    
}
