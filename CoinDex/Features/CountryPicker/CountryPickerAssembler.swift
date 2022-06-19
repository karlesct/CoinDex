//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class CountryPickerAssembler {

    // MARK: - Properties

    // MARK: - Init

    init() {}

    // MARK: - Methods

    func viewController() -> UIViewController {
        let viewController = CountryPickerViewController.loadFromNib()
        viewController.presenter = self.presenter()
        viewController.loggingService = self.logging()
        return viewController
    }

    private func presenter() -> CountryPickerPresenterProtocol {
        let presenter = CountryPickerPresenter(repository: self.repository())
        return presenter
    }

    private func repository() -> CountryPickerRepositoryProtocol {
        let repository = CountryPickerRepository()
        return repository
    }
    
    private func logging() -> LoggingServiceProtocol {
        let loggingService = LoggingService()
        return loggingService
    }
}

