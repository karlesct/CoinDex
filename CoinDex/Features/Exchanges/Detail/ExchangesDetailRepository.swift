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
    let dataTransferService: DataTransferService
    
    // MARK: - Init
    
    init(baseURL: String,
         dataTransferService: DataTransferService) {
        self.baseURL = baseURL
        self.dataTransferService = dataTransferService
    }

    // MARK: - Methods

    func fetchList(id: String,
                   completion: @escaping (Result<[TModel], Error>) -> Void) {
        let endpoint = ExchangesIdRequest(baseURL: self.baseURL,
                                          id: id)
        self.dataTransferService.request(endpoint: endpoint) { result in
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
