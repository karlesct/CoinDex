//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

typealias CoinsMarketsResponse = [CoinsMarketsResponseElement]

struct CoinsMarketsResponseElement: Codable {
    let id: String
    let symbol: String
    let name: String
    let image: String
    let currentPrice: Double
    let marketCap: Double
    let marketCapRank: Int?
    let fullyDilutedValuation: Int?
    let totalVolume: Double
    let high24H: Double?
    let low24H: Double?
    let priceChange24H: Double?
    let priceChangePercentage24H: Double?
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply: Double
    let totalSupply: Double?
    let maxSupply: Double?
    let ath: Double
    let athChangePercentage: Double
    let athDate: Date
    let atl, atlChangePercentage: Double
    let atlDate: Date
    let roi: CoinsMarketsRoi?
    let lastUpdated: String
    let priceChangePercentage1HInCurrency: Double?
    
}

struct CoinsMarketsRoi: Codable {
    let times: Double
    let currency: CoinsMarketsCurrency
    let percentage: Double
}

enum CoinsMarketsCurrency: String, Codable {
    case btc
    case eth
    case usd
}
