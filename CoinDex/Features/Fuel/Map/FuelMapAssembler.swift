//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class FuelMapAssembler {

    // MARK: - Properties

    private let navigationController: UINavigationController?

    // MARK: - Init

    public init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    // MARK: - Methods

    func viewController() -> UIViewController {
        let viewController = FuelMapViewController.loadFromNib()
        viewController.viewModel = self.viewModel()
        return viewController
    }

    private func viewModel() -> FuelMapViewModelProtocol {
        let viewModel = FuelMapViewModel()
        return viewModel
    }
}


