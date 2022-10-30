//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class MainMasterAssembler {

    // MARK: - Properties

    private let navigationController: UINavigationController

    // MARK: - Init

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Methods

    func viewController() -> UIViewController {
        let viewController = MainMasterViewController.loadFromNib()
        viewController.viewModel = self.viewModel()
        viewController.navigator = self.navigator()
        return viewController
    }

    private func viewModel() -> MainMasterViewModelProtocol {
        let logging = self.logging()
        let viewModel: MainMasterViewModel = .init(logging: logging)
        return viewModel
    }
   
    private func navigator() -> MainMasterNavigator {
        let navigator: MainMasterNavigator = .init(navigationController: self.navigationController)
        return navigator
    }
    
    private func logging() -> LoggingServiceProtocol {
        let loggingService: LoggingService = .init()
        return loggingService
    }
}
