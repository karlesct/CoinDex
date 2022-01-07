//
//  Copyright © 2022 CCT. All rights reserved.
//

import UIKit

final class TutorialPageAssembler {

    // MARK: - Properties

    private var model: TutorialPageModel

    // MARK: - Init

    init(model: TutorialPageModel) {
        self.model = model
    }

    // MARK: - Methods

    func viewController() -> UIViewController {
        let viewController = TutorialPageViewController.loadFromNib()
        viewController.model = model
        return viewController
    }
}
