//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class ExchangesDetailAssembler {

    // MARK: - Properties

    private let id: String

    // MARK: - Init

    init(id: String) {
        self.id = id
    }

    // MARK: - Methods

    func viewController() -> UIViewController {
        let viewController = ExchangesDetailViewController.loadFromNib()
        viewController.presenter = self.presenter()
        return viewController
    }

    private func presenter() -> ExchangesDetailPresenterProtocol {
        let repository = self.repository()
        let logging = self.logging()
        let presenter = ExchangesDetailPresenter(id: self.id,
                                                 repository: repository,
                                                 logging: logging)
        return presenter
    }
    
    private func repository() -> ExchangesDetailRepositoryProtocol {
        let networkService = self.networkService()
        let baseURL = self.baseURL()
        let repository = ExchangesDetailRepository(baseURL: baseURL,
                                                   networkService: networkService)
        return repository
    }
    
    private func networkService() -> NetworkServiceProtocol {
        let networkService = DefaultNetworkService()
        return networkService
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

