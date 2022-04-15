//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class CustomNavigationController: UINavigationController {

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    // MARK: - Helpers

    private func setup() {

        self.delegate = self

        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = .primary
            navigationBar.standardAppearance = navBarAppearance
            navigationBar.scrollEdgeAppearance = navBarAppearance
        } else {
            // Fallback on earlier versions
            self.navigationController?.navigationBar.barTintColor = .primary
            self.navigationController?.navigationBar.isTranslucent = false
        }
        self.navigationBar.barStyle = .black
        self.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

    }

}

extension CustomNavigationController {
    //NOTE: if you have view controllers embedded into UINavigationController and your view controller's preferredStatusBarStyle method not getting called - you will have to workaround it by writing something like following:
    override public var preferredStatusBarStyle: UIStatusBarStyle {
        return  .lightContent //topViewController?.preferredStatusBarStyle ?? .lightContent
    }
}


extension CustomNavigationController: UINavigationControllerDelegate {

    // MARK: - Delegate

    func navigationController(_ navigationController: UINavigationController,
                              willShow viewController: UIViewController,
                              animated: Bool) {

        let item = UIBarButtonItem(title: .empty,
                                   style: .plain,
                                   target: nil,
                                   action: nil)
        item.tintColor = .white
        viewController.navigationItem.backBarButtonItem = item

    }
}

