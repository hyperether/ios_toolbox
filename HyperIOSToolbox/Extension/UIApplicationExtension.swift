//
//  UIApplicationExtension.swift
//  HyperIOSToolbox
//
//  Created by Sinisa on 21/04/2020.
//

import Foundation

extension UIApplication {
    
    
    // Application running environment.
    public enum Environment {
        case debug
        case testFlight
        case appStore
    }

    // Current inferred app environment.
    public static var inferredEnvironment: Environment {
        #if DEBUG
        return .debug

        #elseif targetEnvironment(simulator)
        return .debug

        #else
        if Bundle.main.path(forResource: "embedded", ofType: "mobileprovision") != nil {
            return .testFlight
        }

        guard let appStoreReceiptUrl = Bundle.main.appStoreReceiptURL else {
            return .debug
        }

        if appStoreReceiptUrl.lastPathComponent.lowercased() == "sandboxreceipt" {
            return .testFlight
        }

        if appStoreReceiptUrl.path.lowercased().contains("simulator") {
            return .debug
        }

        return .appStore
        #endif
    }
    
    //Current orientation of the interface
    public static var interfaceOrientationStatus: UIInterfaceOrientation {
        return UIApplication.shared.statusBarOrientation
    }
    
    public static var displayName: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
    }
    
    class var appVersion: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    }
    
    class var appBuild: String {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as! String
    }
    
    public static var versionBuild: String {
        let version = appVersion, build = appBuild
        return version == build ? "v\(version)" : "v\(version)(\(build))"
    }
    
    public static func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
    
}
