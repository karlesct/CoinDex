//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

class TabBarController: UITabBarController {

    // MARK: - IBoutlets

    // MARK: - Properties

//    var viewModel: ChatViewModelProtocol?

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        self.createTabBarController()
    }

    // MARK: - Methods

    func createTabBarController() {

        self.tabBar.barTintColor = .xFFFFFF
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = .primaryColor

        let firstVc = UIViewController()
        firstVc.title = "First"
        firstVc.view.backgroundColor =  .red
        firstVc.tabBarItem = UITabBarItem.init(title: "Home", image: UIImage(named: "HomeTab"), tag: 0)

        let secondVc = TutorialAssembler().viewController()
        secondVc.title = "Tutorial"
        secondVc.view.backgroundColor =  .green
        secondVc.tabBarItem = UITabBarItem.init(title: "Location", image: UIImage(named: "Location"), tag: 1)

        let controllerArray = [firstVc, secondVc]
        //UITabBar.setTransparentTabBar()
        self.viewControllers = controllerArray.map{ UINavigationController.init(rootViewController: $0)}
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
