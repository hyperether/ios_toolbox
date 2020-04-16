//
//  UIViewControllerExtension.swift
//  HyperIOSToolbox
//
//  Created by Sinisa on 09/04/2020.
//

import Foundation

public extension UIViewController {
    
    func setDoubleLineTitleView(line1: String, line2: String, font: UIFont = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.medium)){
        guard let navBar = navigationController?.navigationBar else { return }
        var titleLabel = navigationItem.titleView as? UILabel
        if titleLabel == nil {
            let rect = CGRect(origin: .zero, size: CGSize(width: 120, height: navBar.frame.height))
            titleLabel = UILabel(frame: rect)
            titleLabel!.numberOfLines = line1.isEmpty ? 1 : 2
            titleLabel!.textAlignment = .center
            titleLabel!.adjustsFontSizeToFitWidth = true
            titleLabel!.minimumScaleFactor = 0.5
        }
        
        navigationItem.titleView = titleLabel
        let oneLine = line1.isEmpty ? (line2.isEmpty ? "" : line2) : (line2.isEmpty ? line1 : "")
        let twoLines = line1 + "\n" + line2
        titleLabel!.text = oneLine.isEmpty ? twoLines : oneLine
        let attributed = NSMutableAttributedString(string: titleLabel!.text!)
        if oneLine.isEmpty {
            let firstLine = twoLines.range(of: line1)
            let secondLine = twoLines.range(of: line2)
            attributed.addAttributes([NSAttributedString.Key.font: font], range: firstLine)
            attributed.addAttributes([NSAttributedString.Key.font: font], range: secondLine)
        } else {
            let line = oneLine.range(of: line1.isEmpty ? line2 : line1)
            attributed.addAttributes([NSAttributedString.Key.font: font], range: line)
        }
        titleLabel!.attributedText = attributed
        
    }
}


extension String {
    
    func range(of substring: String) -> NSRange {
      let nsString = self as NSString
      return nsString.range(of: substring)
    }
}
