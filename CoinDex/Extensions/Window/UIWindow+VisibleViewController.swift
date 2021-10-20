//
//  Copyright © 2021 CCT. All rights reserved.
//


import UIKit

extension UIWindow {

    var visibleViewController: UIViewController? {
        return UIWindow.getVisibleViewControllerFrom(viewController: self.rootViewController)
    }

    static func getVisibleViewControllerFrom(viewController: UIViewController?) -> UIViewController? {
        if let navigationController = viewController as? UINavigationController {
            return UIWindow.getVisibleViewControllerFrom(viewController: navigationController.visibleViewController)
        } else if let tabBarController = viewController as? UITabBarController {
            return UIWindow.getVisibleViewControllerFrom(viewController: tabBarController.selectedViewController)
        } else {
            if let presentedViewController = viewController?.presentedViewController {
                return UIWindow.getVisibleViewControllerFrom(viewController: presentedViewController)
            } else {
                return viewController
            }
        }
    }
}
