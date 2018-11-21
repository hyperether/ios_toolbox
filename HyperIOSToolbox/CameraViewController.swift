//
//  CameraViewController.swift
//  HyperIOSToolbox
//
//  Created by nikola on 11/21/18.
//  Copyright © 2018 hyperether. All rights reserved.
//

import UIKit

open class CameraViewController: BasicEditViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    public var picker: UIImagePickerController? = UIImagePickerController()
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        picker?.delegate = self
    }
    
    // Choose image from gallery.
    open func openGallery() {
        picker!.allowsEditing = true
        picker!.sourceType = UIImagePickerController.SourceType.photoLibrary
        present(picker!, animated: true, completion: nil)
    }
    
    // Take a new photo.
    open func openCamera() {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera)){
            picker!.allowsEditing = true
            picker!.sourceType = UIImagePickerController.SourceType.camera
            picker!.cameraCaptureMode = .photo
            present(picker!, animated: true, completion: nil)
        }else{
            let alertTitle = NSLocalizedString("alert.title", bundle: Bundle.init(identifier: "com.hyperether.toolbox")!,   comment:"")
            let alertMessage = NSLocalizedString("alert.message", bundle: Bundle.init(identifier: "com.hyperether.toolbox")!,  comment:"")
            let btnTitle = NSLocalizedString("btn.title", bundle: Bundle.init(identifier: "com.hyperether.toolbox")!,   comment:"")
            let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
            let ok = UIAlertAction(title: btnTitle, style:.default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
    }
    
    // Show alert for user to choose image from gallery or to take new photo.
    open func getImage() {
        let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        optionMenu.popoverPresentationController?.sourceView = self.view
        var title = ""
        
        title = NSLocalizedString("alert.take.photo.title", bundle: Bundle.init(identifier: "com.hyperether.toolbox")!,  comment:"")
        
        let takePhotoTitle = NSLocalizedString("alert.take.photo", bundle: Bundle.init(identifier: "com.hyperether.toolbox")!,  comment:"")
        let takePhoto = UIAlertAction(title: takePhotoTitle, style: .default) { (alert : UIAlertAction!) in
            self.openCamera()
        }
        
        let sharePhotoTitle = NSLocalizedString("share.photo.title", bundle: Bundle.init(identifier: "com.hyperether.toolbox")!,  comment:"")
        let sharePhoto = UIAlertAction(title: sharePhotoTitle, style: .default) { (alert : UIAlertAction!) in
            self.openGallery()
        }
        
        let cancelActionTitle = NSLocalizedString("action.cancel", bundle: Bundle.init(identifier: "com.hyperether.toolbox")!,  comment:"")
        let cancelAction = UIAlertAction(title: cancelActionTitle, style: .cancel) { (alert : UIAlertAction!) in
        }
        
        optionMenu.addAction(takePhoto)
        optionMenu.addAction(sharePhoto)
        optionMenu.addAction(cancelAction)
        optionMenu.title = title
        self.present(optionMenu, animated: true, completion: nil)
    }
}

// MARK: Image picker delegates.
extension CameraViewController {
    
    open func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    open func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {}
}
