//
//  ConnectionManager.swift
//  HyperIOSToolbox
//
//  Created by nikola on 11/22/18.
//  Copyright © 2018 hyperether. All rights reserved.
//

import Foundation
import Reachability

open class ConnectionManager: NSObject {
    
    static  let shared = ConnectionManager()
    
    var listeners = [NetworkStatusListener]()
    
    // Starts monitoring of network, adding observer.
    func startMonitoring() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.reachabilityChanged), name: Notification.Name.reachabilityChanged, object: reachability)
        do{
            try reachability.startNotifier()
        } catch {
            debugPrint("Could not start reachability notifier")
        }
    }
    
    // Stops monitoring of network, remove observer.
    func stopMonitoring(){
        reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: Notification.Name.reachabilityChanged, object: reachability)
    }
    
    // Get network status.
    var isNetworkAvailable : Bool {
        return reachabilityStatus != .none
    }
    
    var reachabilityStatus: Reachability.Connection = .none
    
    let reachability = Reachability()!
    
    // Track reachabilty state. Selector for observer.
    @objc func reachabilityChanged(notification: Notification) {
        let reachability = notification.object as! Reachability
        debugPrint("Connection changed !!!!!")
        switch reachability.connection {
        case .none:
            debugPrint("Network became unreachable")
        case .wifi:
            if(reachabilityStatus == .cellular){
                print("Network change we need to send to server, now is \(Reachability.Connection.wifi)")
            }
            debugPrint("Network reachable through WiFi")
        case .cellular:
            if(reachabilityStatus == .wifi){
                print("Network change we need to send to server, now is \(Reachability.Connection.cellular)")
            }
            debugPrint("Network reachable through Cellular Data")
        }
        reachabilityStatus = reachability.connection
        // Sending message to each of the delegates
        for listener in listeners {
            listener.networkStatusDidChange(status: reachability.connection)
        }
    }
    
    // Add listener to listeners array.
    func addListener(listener: NetworkStatusListener){
        listeners.append(listener)
        if(reachabilityStatus == .none){
            listener.networkStatusDidChange(status: reachabilityStatus)
        }
    }
    
    // Removes a listener from listeners array
    //
    // - parameter delegate: the listener which is to be removed
    func removeListener(listener: NetworkStatusListener){
        listeners = listeners.filter{ $0 !== listener}
    }
    
}
