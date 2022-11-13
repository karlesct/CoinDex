//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class BreakingBadMasterNavigator: Navigator {

    enum Destination {
        case detail(item: FavoritableCharactersItemResponse,
                    delegate: BreakingBadDetailViewControllerDelegate)
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
        case let .detail(item, delegate):
            let assembler: BreakingBadDetailAssembler = .init(item: item)
            let viewController = assembler.viewController(delegate: delegate)
            viewController.hidesBottomBarWhenPushed = true
            return viewController
        }
    }
}



