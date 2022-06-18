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

class ExchangesIdResponseConverter {
    static func convert(model: ExchangesIdResponse) -> [TModel] {
        var items: [TModel] = []

        let itemInfo = ExchangesDetailInfoCellModel(name: model.name,
                                                    image: model.image,
                                                    year: model.yearEstablished,
                                                    country: model.country,
                                                    centralized: model.centralized)
        items.append(itemInfo)
        
        let itemTrust = ExchangesDetailTrustCellModel(scoreRank: model.trustScoreRank,
                                                 trustScore: model.trustScore,
                                                 tradeVolumeBtc: model.tradeVolume24HBtc,
                                                 tradeVolumeNormalizedBtc: model.tradeVolume24HBtcNormalized)
        items.append(itemTrust)
        return items
    }
}
