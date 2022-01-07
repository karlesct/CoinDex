//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class LaunchScreenAssembler {

    // MARK: - Properties

    // MARK: - Init

    init() {}

    // MARK: - Methods

    func viewController() -> UIViewController {
        let viewController = LaunchScreenViewController.loadFromNib()
        viewController.viewModel = self.viewModel()
        return viewController
    }

    private func viewModel() -> LaunchScreenViewModelProtocol {
        let viewModel = LaunchScreenViewModel()
        return viewModel
    }
}

