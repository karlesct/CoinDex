//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

struct ExchangeDataResponse: Codable {
    let name: String
    let openInterestBtc: Double
    let tradeVolume24HBtc: String
    let numberOfPerpetualPairs: Int
    let numberOfFuturesPairs: Int
    let image: String
    let country: String
    let exchangeDataResponseDescription: String?
    let url: String
    let tickers: [ExchangeDataTicker]
}


struct ExchangeDataTicker: Codable {
    let symbol, base: String
    let target: String
    let tradeUrl: String
    let contractType: String
    let last: Double
    let h24PercentageChange: Double
    let index: Double?
    let indexBasisPercentage: Double
    let bidAskSpread: Double
    let fundingRate: Double
    let openInterestUsd: Double
    let h24Volume: Double
    let convertedVolume: ExchangeDataConverted?
    let convertedLast: ExchangeDataConverted
    let lastTraded: Int
    let expiredAt: Int?
}

struct ExchangeDataConverted: Codable {
    let btc: String
    let eth: String
    let usd: String
}
