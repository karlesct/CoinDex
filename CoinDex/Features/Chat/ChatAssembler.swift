//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class ChatAssembler {

    // MARK: - Properties

    // MARK: - Init

    init() {}

    // MARK: - Methods

    func viewController() -> UIViewController {
        let viewController = ChatViewController.loadFromNib()
        viewController.viewModel = self.viewModel()
        return viewController
    }

    private func viewModel() -> ChatViewModelProtocol {
        let viewModel = ChatViewModel()
        viewModel.useCase = self.useCase()
        return viewModel
    }

    private func useCase() -> ChatUseCaseProtocol {
        let useCase = ChatUseCase()
        return useCase
    }

}
