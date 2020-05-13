//
//  UIDeviceExtension.swift
//  HyperIOSToolbox
//
//  Created by Sinisa on 21/04/2020.
//

import Foundation

extension UIDevice {
    
    public static var  systemVer: String {
        return UIDevice.current.systemVersion
    }
    
    // Returns true if the device is iPhone
    public static var  is_iPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone
    }
    
    // Returns true if the device is iPad
    public static var  is_iPad: Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
    }
    
    public static var hasTopNotch: Bool {
        // with notch: 44.0 on iPhone X, XS, XS Max, XR.
        // without notch: 24.0 on iPad Pro 12.9" 3rd generation, 20.0 on iPhone 8 on iOS 12+.
        if #available(iOS 13.0,  *){
            return UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.safeAreaInsets.top ?? 0 > 24
        }else if #available(iOS 11.0,  *) {
            return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 24
        }
        return false
    }
    
    public static var hasBottomSafeAreaInsets: Bool {
        // with home indicator: 34.0 on iPhone X, XS, XS Max, XR.
        // with home indicator: 20.0 on iPad Pro 12.9" 3rd generation.
        if #available(iOS 13.0,  *){
            return UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.safeAreaInsets.bottom ?? 0 > 0
        }else if #available(iOS 11.0,  *) {
            return UIApplication.shared.delegate?.window??.safeAreaInsets.bottom ?? 0 > 0
        }
        return false
    }
    
    //current orientation of the device
    public static func deviceOrientationStatus(_ result: (UIDeviceOrientation) -> ()) {
        if !UIDevice.current.isGeneratingDeviceOrientationNotifications {
            UIDevice.current.beginGeneratingDeviceOrientationNotifications()
        }
        result(UIDevice.current.orientation)
       UIDevice.current.endGeneratingDeviceOrientationNotifications()
    }
    
}

