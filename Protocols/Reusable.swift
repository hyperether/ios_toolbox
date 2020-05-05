//
//  Reusable.swift
//  HyperIOSToolbox
//
//  Created by Sinisa on 05/05/2020.
//

import Foundation
import UIKit

public protocol Reusable: class {
  static var reuseIdentifier: String { get }
  static var nib: UINib? { get }
}

public extension Reusable {
  static var reuseIdentifier: String { return String(describing: self) }
  static var nib: UINib? { return nil }
}
