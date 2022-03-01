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
        viewController.viewModel = self.viewModel()
        return viewController
    }

    private func viewModel() -> CountryPickerViewModelProtocol {
        let viewModel = CountryPickerViewModel(repository: self.repository())
        return viewModel
    }

    private func repository() -> CountryPickerRepositoryProtocol {
        let repository = CountryPickerRepository()
        return repository
    }
}

