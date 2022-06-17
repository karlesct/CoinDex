//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

typealias ExchangesResponse = [ExchangesResponseElement]

struct ExchangesResponseElement: Codable {
    let id: String
    let name: String
    let yearEstablished: Int?
    let country: String?
    let exchangesResponseDescription: String?
    let url: String
    let image: String
    let hasTradingIncentive: Bool?
    let trustScore: Int
    let trustScoreRank: Int
    let tradeVolume24HBtc: Double
    let tradeVolume24HBtcNormalized: Double
}
