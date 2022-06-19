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
        let viewController = TutorialViewController.loadFromNib()
        viewController.presenter = self.presenter()
        return viewController
    }

    private func presenter() -> TutorialPresenterProtocol {
        let presenter = TutorialPresenter()
        return presenter
    }
}



