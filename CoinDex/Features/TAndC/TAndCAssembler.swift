//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class TAndCAssembler {

    // MARK: - Properties

    private var stringURL: String?

    // MARK: - Init

    public init(stringURL: String) {
        self.stringURL = stringURL
    }

    // MARK: - Methods

    func viewController() -> UIViewController {
        let viewController = TAndCViewController.loadFromNib()
        viewController.stringURL = stringURL
        return viewController
    }

}

