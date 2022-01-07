//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class MainAssembler {

    // MARK: - Properties

    private let navigationController: UINavigationController

    // MARK: - Init

    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Methods

    func viewController() -> UIViewController {
        let viewController = MainViewController.loadFromNib()
        viewController.viewModel = self.viewModel()
        viewController.navigator = self.navigator()
        return viewController
    }

    private func viewModel() -> MainViewModelProtocol {
        let viewModel = MainViewModel()
        return viewModel
    }

    private func navigator() -> MainNavigator {
        let navigator = MainNavigator(navigationController: self.navigationController)
        return navigator
    }
}
