//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class BreakingBadDetailAssembler {

    // MARK: - Properties

    private let item: FavoritableCharactersItemResponse

    // MARK: - Init

    init(item: FavoritableCharactersItemResponse) {
        self.item = item
    }

    // MARK: - Methods

    func viewController(delegate: BreakingBadDetailViewControllerDelegate) -> UIViewController {
        let viewController = BreakingBadDetailViewController.loadFromNib()
        viewController.viewModel = self.viewModel()
        viewController.delegate = delegate
        return viewController
    }

    private func viewModel() -> BreakingBadDetailViewModelProtocol {
        let viewModel = BreakingBadDetailViewModel(item: self.item)
        return viewModel
    }
    
}


