//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

class TabBarController: UITabBarController {

    // MARK: - IBoutlets

    // MARK: - Properties

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.setupUI()
    }

    // MARK: - Methods

    func setupUI() {
        self.tabBar.barTintColor = .xFFFFFF
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = .primary
    }

}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("viewcontroller selected: \(String(describing: viewController.self))")
    }
}

extension UITabBar {
    static func setTransparentTabBar() {
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().clipsToBounds = true
    }
}
