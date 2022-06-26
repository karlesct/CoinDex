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
    let dataTransferService: DataTransferService
    
    // MARK: - Init
    
    init(baseURL: String,
         dataTransferService: DataTransferService) {
        self.baseURL = baseURL
        self.dataTransferService = dataTransferService
    }

    // MARK: - Methods

    func fetchList(page: Int,
                   completion: @escaping (Result<[TModel], Error>) -> Void) {
        let endpoint = ExchangesRequest(baseURL: self.baseURL,
                                        page: page)
        self.dataTransferService.request(endpoint: endpoint) { result in
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
