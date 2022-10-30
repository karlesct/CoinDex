//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class MapsAssembler {

    // MARK: - Properties

    // MARK: - Init

    init() {}

    // MARK: - Methods

    func viewController() -> UIViewController {
        let viewController = MapsViewController.loadFromNib()
        viewController.viewModel = self.viewModel()
        return viewController
    }

    private func viewModel() -> MapsViewModelProtocol {
        let logging = self.logging()
        let viewModel = MapsViewModel(logging: logging)
        return viewModel
    }
    
//    private func repository() -> ExchangesListMasterRepositoryProtocol {
//        let dataTransferService = self.dataTransferService()
//        let baseURL = self.baseURL()
//        let repository = ExchangesListMasterRepository(baseURL: baseURL,
//                                                       dataTransferService: dataTransferService)
//        return repository
//    }
    
    private func logging() -> LoggingServiceProtocol {
        let loggingService = LoggingService()
        return loggingService
    }
    
}
