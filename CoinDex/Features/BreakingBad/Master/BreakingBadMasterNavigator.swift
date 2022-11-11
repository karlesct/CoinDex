//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class BreakingBadMasterNavigator: Navigator {

    enum Destination {
        case detail(id: Int)
    }

    private var navigationController: UINavigationController

    // MARK: - Initializer

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Navigator

    func navigate(to destination: Destination) {
        switch destination {
        case .detail:
            let viewController = self.makeViewController(for: destination)
            self.navigationController.pushViewController(viewController,
                                                         animated: true)
        }
    }

    // MARK: - Private

    private func makeViewController(for destination: Destination) -> UIViewController {
        switch destination {
        case let .detail(id):
//            let assembler = ExchangesDetailAssembler(id: id)
//            let viewController = assembler.viewController()
//            viewController.hidesBottomBarWhenPushed = true
            return UIViewController()
        }
    }
}



