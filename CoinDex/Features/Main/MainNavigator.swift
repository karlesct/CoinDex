//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class MainNavigator: Navigator {

    enum Destination {
        case main
    }

    private var navigationController: UINavigationController

    // MARK: - Initializer

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Navigator

    func navigate(to destination: Destination) {

        let viewController = makeViewController(for: destination)
        navigationController.pushViewController(viewController, animated: true)

    }

    // MARK: - Private

    private func makeViewController(for destination: Destination) -> UIViewController {
        switch destination {
        case .main:
            return TutorialAssembler().viewController()
        }
    }
}

