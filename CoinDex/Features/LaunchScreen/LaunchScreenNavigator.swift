//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class LaunchScreenNavigator: Navigator {

    enum Destination {
        case coinListMaster
//        case mainTest
    }

    private var navigationController: UINavigationController

    // MARK: - Initializer

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Navigator

    func navigate(to destination: Destination) {

        let viewController = makeViewController(for: destination)
        self.navigationController.viewControllers = [viewController]
    }

    // MARK: - Private

    private func makeViewController(for destination: Destination) -> UIViewController {
        switch destination {
//        case .mainTest:
//            let assembler = MainAssembler(navigationController: self.navigationController)
//            return assembler.viewController()
        case .coinListMaster:
            let assembler = ExchangesListMasterAssembler(navigationController: self.navigationController)
            return assembler.viewController()
        }
    }
}
