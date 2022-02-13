//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class TabBarAssembler {

    // MARK: - Properties

    // MARK: - Init

    public init() {
    }

    // MARK: - Methods

    func viewController() -> UIViewController {
        let viewController = TabBarController.loadFromNib()
//        viewController.viewModel = self.viewModel()
        return viewController
    }

//    private func viewModel() -> TabBarViewModelProtocol {
//        let viewModel = MainViewModel()
//        return viewModel
//    }

}
