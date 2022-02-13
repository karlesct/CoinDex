//
//  Copyright © 2022 CCT. All rights reserved.
//

import UIKit

final class TutorialAssembler {

    // MARK: - Properties

    // MARK: - Init

    init() {}

    // MARK: - Methods

    func viewController() -> UIViewController {
        let viewController = TestViewController.loadFromNib()
        viewController.viewModel = self.viewModel()
        return viewController
    }

//    func viewController() -> UIViewController {
//        let viewController = TutorialViewController.loadFromNib()
//        viewController.viewModel = self.viewModel()
//        return viewController
//    }

    private func viewModel() -> TutorialViewModelProtocol {
        let viewModel = TutorialViewModel()
        return viewModel
    }
}



