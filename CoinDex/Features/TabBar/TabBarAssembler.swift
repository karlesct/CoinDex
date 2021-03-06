//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class TabBarAssembler {

    // MARK: - Properties

    // MARK: - Init

    public init() {
    }

    // MARK: - Methods

    func viewController() -> UIViewController {
        let viewController = TabBarController.loadFromNib()
        viewController.viewControllers = self.viewControllers()
        return viewController
    }

    private func viewControllers() -> [UIViewController] {
        let viewControllers = [
            self.exchangesViewController(),
            self.tutorialViewController(),
            self.countryPickerViewController()
        ]
        return viewControllers
    }
    
    private func exchangesViewController() -> UIViewController {
        let navigationController = CustomNavigationController()
        let assembler = ExchangesListMasterAssembler(navigationController: navigationController)
        let viewController = assembler.viewController()
        navigationController.viewControllers = [viewController]
        viewController.tabBarItem.image = .tabBar.exchangesIcon
        viewController.tabBarItem.title = "exchange_list_master_title".localized
        return navigationController
    }
    
    private func tutorialViewController() -> UIViewController {
        let assembler = TutorialAssembler()
        let viewController = assembler.viewController()
        viewController.tabBarItem.image = .tabBar.welcomeIcon
        viewController.tabBarItem.title = "tutorial_title".localized
        return viewController
    }
    
    private func countryPickerViewController() -> UIViewController {
        let assembler = CountryPickerAssembler()
        let viewController = assembler.viewController()
        viewController.tabBarItem.image = .tabBar.countryPickerIcon
        viewController.tabBarItem.title = "country_picker_title".localized
        return viewController
    }

}
