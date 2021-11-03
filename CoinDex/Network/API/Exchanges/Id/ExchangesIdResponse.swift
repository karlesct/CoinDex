//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

struct ExchangesIdResponse: Codable {
    let name: String
    let yearEstablished: Int
    let country: String
    let description: String
    let url: String
    let image: String
    let facebookUrl: String
    let redditUrl: String
    let telegramUrl: String
    let slackUrl: String
    let otherUrl1: String
    let otherUrl2: String
    let twitterHandle: String
    let hasTradingIncentive: Bool
    let centralized: Bool
    let publicNotice: String
    let alertNotice: String
    let trustScore: Int
    let trustScoreRank: Int
    let tradeVolume24HBtc: Double
    let tradeVolume24HBtcNormalized: Double
    let tickers: [ExchangesIdTicker]
    let statusUpdates: [ExchangesIdStatusUpdate]
}

struct ExchangesIdStatusUpdate: Codable {
    let description: String
    let category: String
    let createdAt: String
    let user: String
    let userTitle: String
    let pin: Bool
    let project: ExchangesIdProject
}

struct ExchangesIdProject: Codable {
    let type: String
    let id: String
    let name: String
    let image: ExchangesIdImage
}

struct ExchangesIdImage: Codable {
    let thumb: String
    let small: String
    let large: String
}

struct ExchangesIdTicker: Codable {
    let base: String
    let target: String
    let market: ExchangesIdMarket
    let last: Double
    let volume: Double
    let convertedLast: [String: Double]
    let convertedVolume: [String: Double]
    let trustScore: String
    let bidAskSpreadPercentage: Double
    let timestamp: Date
    let lastTradedAt: Date
    let lastFetchAt: Date
    let isAnomaly: Bool
    let isStale: Bool
    let tradeUrl: String
    let tokenInfoUrl: String?
    let coinId: String
    let targetCoinId: String?
}

struct ExchangesIdMarket: Codable {
    let name: String
    let identifier: String
    let hasTradingIncentive: Bool
}
