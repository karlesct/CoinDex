//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class LoginAssembler {

    // MARK: - Properties

    let navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func viewController() -> UIViewController {
        let viewController = LoginViewController()
        viewController.viewModel = self.viewModel()
        return viewController
    }

    private func viewModel() -> LoginViewModelProtocol {
        let viewModel = LoginViewModel(repository: self.repository())
        return viewModel
    }

    private func repository() -> LoginRepositoryProtocol {
        let repository = LoginRepository()
        return repository
    }
}
