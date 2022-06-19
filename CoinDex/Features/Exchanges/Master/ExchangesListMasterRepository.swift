//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

protocol ExchangesListMasterRepositoryProtocol {
    func fetchList(page: Int,
                   completion: @escaping (Result<[TModel], Error>) -> Void)
}

class ExchangesListMasterRepository: ExchangesListMasterRepositoryProtocol {
    
    // MARK: - Properties
    
    let baseURL: String
    let networkService: NetworkServiceProtocol
    
    // MARK: - Init
    
    init(baseURL: String,
         networkService: NetworkServiceProtocol) {
        self.baseURL = baseURL
        self.networkService = networkService
    }

    // MARK: - Methods

    func fetchList(page: Int,
                   completion: @escaping (Result<[TModel], Error>) -> Void) {
        self.networkService.request(ExchangesRequest(baseURL: self.baseURL, page: page)) { result in
            switch result {
            case let .success(model):
                let item = ExchangeResponseConverter.convert(exchangeResponse: model)
                completion(.success(item))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
