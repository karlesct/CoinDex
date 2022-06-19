//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class ExchangesListMasterAssembler {

    // MARK: - Properties

    private let navigationController: UINavigationController

    // MARK: - Init

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Methods

    func viewController() -> UIViewController {
        let viewController = ExchangesListMasterViewController.loadFromNib()
        viewController.presenter = self.presenter()
        viewController.navigator = self.navigator()
        return viewController
    }

    private func presenter() -> ExchangesListMasterPresenterProtocol {
        let repository = self.repository()
        let logging = self.logging()
        let presenter = ExchangesListMasterPresenter(repository: repository,
                                                     logging: logging)
        return presenter
    }
    
    private func repository() -> ExchangesListMasterRepositoryProtocol {
        let networkService = self.networkService()
        let baseURL = self.baseURL()
        let repository = ExchangesListMasterRepository(baseURL: baseURL,
                                                       networkService: networkService)
        return repository
    }
    
    private func networkService() -> NetworkServiceProtocol {
        let networkService = DefaultNetworkService()
        return networkService
    }

    private func navigator() -> ExchangesListMasterNavigator {
        let navigator = ExchangesListMasterNavigator(navigationController: self.navigationController)
        return navigator
    }
    
    private func baseURL() -> String {
        let configuration = ConfigLoader.parseFile().API
        let baseURL = [
            configuration?.Scheme,
            configuration?.Host,
            configuration?.Path]
            .compactMap { $0 }
            .joined()
        return baseURL
    }
    
    private func logging() -> LoggingServiceProtocol {
        let loggingService = LoggingService()
        return loggingService
    }
}
