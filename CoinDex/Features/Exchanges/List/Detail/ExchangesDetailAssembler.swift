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
        viewController.viewModel = self.viewModel()
        return viewController
    }

    private func viewModel() -> ExchangesDetailViewModelProtocol {
        let repository = self.repository()
        let viewModel = ExchangesDetailViewModel(id: self.id,
                                                 repository: repository)
        return viewModel
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
}

