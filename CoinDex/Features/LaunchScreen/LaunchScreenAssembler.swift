//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class LaunchScreenAssembler {

    // MARK: - Properties

    // MARK: - Init

    init() {
    }

    // MARK: - Methods

    func viewController() -> UIViewController {
        let viewController = LaunchScreenViewController.loadFromNib()
        viewController.presenter = self.presenter()
        viewController.navigator = self.navigator()
        return viewController
    }

    private func presenter() -> LaunchScreenPresenterProtocol {
        let presenter = LaunchScreenPresenter()
        return presenter
    }

    private func navigator() -> LaunchScreenNavigator {
        let navigator = LaunchScreenNavigator()
        return navigator
    }
}
