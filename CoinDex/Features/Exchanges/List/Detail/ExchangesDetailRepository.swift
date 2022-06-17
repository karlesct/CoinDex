//
//  Copyright © 2022 CCT. All rights reserved.
//


protocol ExchangesDetailRepositoryProtocol {
    func fetchList(page: Int,
                   completion: @escaping (Result<[ExchangesListMasterCellModel], Error>) -> Void)
}

class ExchangesDetailRepository: ExchangesDetailRepositoryProtocol {
    
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
                   completion: @escaping (Result<[ExchangesListMasterCellModel], Error>) -> Void) {
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

