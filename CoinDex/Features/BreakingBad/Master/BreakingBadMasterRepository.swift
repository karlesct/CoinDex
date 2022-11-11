//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

protocol BreakingBadMasterRepositoryProtocol {
    func fetchList(page: Int,
                   completion: @escaping (Result<[TModel], Error>) -> Void)
}

class BreakingBadMasterRepository: BreakingBadMasterRepositoryProtocol {
    
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
        let limit = 20
        let offset = page * limit 
        let endpoint = CharactersLimitAndOffsetRequest(baseURL: self.baseURL,
                                                       limit: limit,
                                                       offset: offset
            )
        self.dataTransferService.request(endpoint: endpoint) { result in
            switch result {
            case let .success(model):
                let item = CharactersResponseConverter.convert(charactersResponse: model)
                completion(.success(item))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}

