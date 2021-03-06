//
//  NetworkListenerController.swift
//  HyperIOSToolbox
//
//  Created by nikola on 11/22/18.
//  Copyright © 2018 hyperether. All rights reserved.
//

import UIKit
import Reachability

open class NetworkListenerController: UIViewController, NetworkStatusListener {
    
    open func networkStatusDidChange(status: Reachability.Connection) {
        switch status {
        case .none, .unavailable:
            debugPrint("Network became unreachable")
        case .wifi:
            debugPrint("Network reachable through WiFi")
        case .cellular:
            debugPrint("Network reachable through Cellular Data")
        }
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ConnectionManager.shared.addListener(listener: self)
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        ConnectionManager.shared.removeListener(listener: self)
    }
}
