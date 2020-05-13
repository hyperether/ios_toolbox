//
//  UICollectionViewExtension.swift
//  HyperIOSToolbox
//
//  Created by Sinisa on 05/05/2020.
//

import Foundation
import UIKit

public extension UICollectionView {
    func registerReusableCell<T: UICollectionViewCell>(_: T.Type) where T: Reusable {
        self.register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerNIbReusableCell<T: UICollectionViewCell>(_: T.Type) where T: NibReusable {
        self.register(T.nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(indexPath: IndexPath) -> T where T: Reusable {
        return self.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as! T
    }
    
    func registerReusableSupplementaryView<T: Reusable>(elementKind: String, _: T.Type) {
        self.register(T.self, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerNibReusableSupplementaryView<T: NibReusable>(elementKind: String, _: T.Type) {
        self.register(T.nib, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableSupplementaryView<T: UICollectionViewCell>(elementKind: String, indexPath: IndexPath) -> T where T: Reusable {
        return self.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as! T
    }
}
