//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class FuelHomeAssembler {

    // MARK: - Properties

    private let navigationController: UINavigationController?

    // MARK: - Init

    public init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    // MARK: - Methods

    func viewController() -> UIViewController {
        let viewController = FuelHomeViewController.loadFromNib()
        viewController.viewModel = self.viewModel()
//        viewController.navigator = self.navigator()
        return viewController
    }

    private func viewModel() -> FuelHomeViewModelProtocol {
        let viewModel = FuelHomeViewModel(repository: self.repository())
        return viewModel
    }

//    private func navigator() -> MainNavigator {
//        let navigator = MainNavigator(navigationController: self.navigationController)
//        return navigator
//    }

    private func repository() -> DefaultRepositoryProtocol {
        let repository = DefaultRepository()
        return repository
    }
}

