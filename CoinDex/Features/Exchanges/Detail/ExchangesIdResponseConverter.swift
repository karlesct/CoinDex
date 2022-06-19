//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

class ExchangesIdResponseConverter {
    static func convert(model: ExchangesIdResponse) -> [TModel] {
        var items: [TModel] = []
        
        items.append(ExchangesIdResponseConverter.convertToInfo(model: model))
        items.append(ExchangesIdResponseConverter.convertTrust(model: model))
        
        return items
    }
    
    static func convertToInfo(model: ExchangesIdResponse) -> ExchangesDetailInfoCellModel {
        let item = ExchangesDetailInfoCellModel(name: model.name,
                                                    image: model.image,
                                                    year: model.yearEstablished,
                                                    country: model.country,
                                                    centralized: model.centralized)
        return item
    }
    
    static func convertTrust(model: ExchangesIdResponse) -> ExchangesDetailTrustCellModel {
        let item = ExchangesDetailTrustCellModel(scoreRank: model.trustScoreRank,
                                                 trustScore: model.trustScore,
                                                 tradeVolumeBtc: model.tradeVolume24HBtc,
                                                 tradeVolumeNormalizedBtc: model.tradeVolume24HBtcNormalized)
        return item
    }
}
