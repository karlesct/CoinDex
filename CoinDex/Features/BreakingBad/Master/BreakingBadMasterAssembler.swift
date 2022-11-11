//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class BreakingBadMasterAssembler {

    // MARK: - Properties

    private let navigationController: UINavigationController

    // MARK: - Init

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Methods

    func viewController() -> UIViewController {
        let viewController = BreakingBadMasterViewController.loadFromNib()
        viewController.viewModel = self.viewModel()
        viewController.navigator = self.navigator()
        return viewController
    }

    private func viewModel() -> BreakingBadMasterViewModelProtocol {
        let repository = self.repository()
        let logging = self.logging()
        let viewModel: BreakingBadMasterViewModel = .init(repository: repository,
                                                          logging: logging)
        return viewModel
    }
    
    private func repository() -> BreakingBadMasterRepositoryProtocol {
        let dataTransferService = self.dataTransferService()
        let baseURL = self.baseURL()
        let repository = BreakingBadMasterRepository(baseURL: baseURL,
                                                       dataTransferService: dataTransferService)
        return repository
    }
    
    private func dataTransferService() -> DataTransferService {
        let networkService = self.networkService()
        let dataTransferService = DefaultDataTransferService(networkService: networkService)
        return dataTransferService
    }
    
    private func networkService() -> NetworkService {
        let networkService = DefaultNetworkService()
        return networkService
    }
   
    private func navigator() -> BreakingBadMasterNavigator {
        let navigator: BreakingBadMasterNavigator = .init(navigationController: self.navigationController)
        return navigator
    }
    
    private func baseURL() -> String {
        let configuration = ConfigLoader.parseFile().BreakingBadAPI
        let baseURL = [
            configuration?.Scheme,
            configuration?.Host,
            configuration?.Path]
            .compactMap { $0 }
            .joined()
        return baseURL
    }
    
    private func logging() -> LoggingServiceProtocol {
        let loggingService: LoggingService = .init()
        return loggingService
    }
}
