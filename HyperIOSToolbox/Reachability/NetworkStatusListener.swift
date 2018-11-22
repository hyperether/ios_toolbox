//
//  NetworkStatusListener.swift
//  HyperIOSToolbox
//
//  Created by nikola on 11/22/18.
//  Copyright © 2018 hyperether. All rights reserved.
//

import Foundation
import Reachability

public protocol NetworkStatusListener : class {
    func networkStatusDidChange(status: Reachability.Connection)
}
