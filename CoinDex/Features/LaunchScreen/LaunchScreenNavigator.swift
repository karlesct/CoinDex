//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class LaunchScreenNavigator: Navigator {

    enum Destination {
        case tabBar(presentView: UIViewController)
    }

    // MARK: - Initializer

    init() {
    }

    // MARK: - Navigator

    func navigate(to destination: Destination) {

        switch destination {
        case let .tabBar(presentView):
            let viewController = makeViewController(for: destination)
            presentView.present(viewController,
                                animated: false)
        }
    }

    // MARK: - Private

    private func makeViewController(for destination: Destination) -> UIViewController {
        switch destination {
        case .tabBar:
            let assembler = TabBarAssembler()
            let viewController = assembler.viewController()
            viewController.modalPresentationStyle = .fullScreen
            return viewController
        }
    }
}
