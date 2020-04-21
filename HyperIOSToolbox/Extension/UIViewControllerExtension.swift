//
//  UIViewControllerExtension.swift
//  HyperIOSToolbox
//
//  Created by Sinisa on 09/04/2020.
//

import Foundation

public extension UIViewController {
    
    func makeTransparent(withTint tint: UIColor = .systemBlue) {
        guard let navBar = navigationController?.navigationBar else { return }
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
        navBar.isTranslucent = true
        navBar.tintColor = tint
        navBar.titleTextAttributes = [.foregroundColor: tint]
    }
    
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
    
    func show(_ viewController: UIViewController) {
        navigationController?.show(viewController, sender: self)
    }
    
    func backToPrevious(animated: Bool = true) {
        if let presentingViewController = presentingViewController {
            presentingViewController.dismiss(animated: animated, completion: nil)
        } else {
            _ = navigationController?.popViewController(animated: animated)
        }
    }
    
    func backToRoot(animated: Bool = true) {
        if let presentingViewController = presentingViewController {
            presentingViewController.dismiss(animated: animated, completion: nil)
        } else {
            _ = navigationController?.popToRootViewController(animated: animated)
        }
    }
    
    func present(_ viewControllerToPresent: UIViewController, completion: @escaping (() -> ())) {
        present(viewControllerToPresent, animated: true, completion: completion)
    }
    
    func present(_ viewControllerToPresent: UIViewController) {
        present(viewControllerToPresent, animated: true, completion: nil)
    }
    
    func presentWithStyle(_ viewController: UIViewController, modalTransitionStyle: UIModalTransitionStyle = .coverVertical, animated flag: Bool = true, completion: (() -> ())? = nil) {
        viewController.modalPresentationStyle = .custom
        viewController.modalTransitionStyle =  modalTransitionStyle
        // Very important
        view.window?.rootViewController?.modalPresentationStyle = .fullScreen
        present(viewController, animated: flag, completion: completion)
    }
    
    func dismiss(completion: (() -> Void)? = nil) {
        presentingViewController?.dismiss(animated: true, completion: completion)
    }
    
    func dismissToTop(animated: Bool = true, completion: (() -> Void)? = nil) {
        var presentedViewController = self
        while let presentingViewController = presentedViewController.presentingViewController {
            presentedViewController = presentingViewController
        }
        presentedViewController.dismiss(animated: animated, completion: completion)
    }
    
    func add(_ child: UIViewController) {
        willMove(toParent: self)
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func remove() {
        guard parent != nil else { return }
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
    
}


extension String {
    
    func range(of substring: String) -> NSRange {
      let nsString = self as NSString
      return nsString.range(of: substring)
    }
}
