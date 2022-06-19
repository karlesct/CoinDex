//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class ExchangesListMasterNavigator: Navigator {

    enum Destination {
        case detail(id: String)
    }

    private var navigationController: UINavigationController

    // MARK: - Initializer

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Navigator

    func navigate(to destination: Destination) {

        let viewController = makeViewController(for: destination)
        self.navigationController.pushViewController(viewController, animated: true)

    }

    // MARK: - Private

    private func makeViewController(for destination: Destination) -> UIViewController {
        switch destination {
        case let .detail(id):
            let assembler = ExchangesDetailAssembler(id: id)
            let viewController = assembler.viewController()
            viewController.hidesBottomBarWhenPushed = true
            return viewController
        }
    }
}

