//
//  Copyright © 2022 CCT. All rights reserved.
//


protocol ExchangesDetailRepositoryProtocol {
    func fetchList(id: String,
                   completion: @escaping (Result<[TModel], Error>) -> Void)
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

    func fetchList(id: String,
                   completion: @escaping (Result<[TModel], Error>) -> Void) {
        self.networkService.request(ExchangesIdRequest(baseURL: self.baseURL, id: id)) { result in
            switch result {
            case let .success(model):
                let item = ExchangesIdResponseConverter.convert(model: model)
                completion(.success(item))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
