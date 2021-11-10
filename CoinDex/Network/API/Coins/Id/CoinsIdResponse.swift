//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

struct CoinsIdResponse: Codable {
    let id: String
    let symbol: String
    let name: String
    // let assetPlatformId: JSONNull?
    // let platforms: CoinsIdPlatforms
    let blockTimeInMinutes: Int
    let hashingAlgorithm: String
    let categories: [String]
    let publicNotice: String?
    // let additionalNotices: [JSONAny]
    let localization: CoinsIdLocalizationDescription
    let description: CoinsIdLocalizationDescription
    let links: CoinsIdLinks
    let image: CoinsIdImage
    let countryOrigin: String
    let genesisDate: String
    let sentimentVotesUpPercentage: Double
    let sentimentVotesDownPercentage: Double
    let marketCapRank, coingeckoRank: Int
    let coingeckoScore: Double
    let developerScore: Double
    let communityScore: Double
    let liquidityScore: Double
    let publicInterestScore: Double
    let marketData: CoinsIdMarketData
    let communityData: CoinsIdCommunityData
    let developerData: CoinsIdDeveloperData
    let publicInterestStats: CoinsIdPublicInterestStats
    let statusUpdates: [String?]
    let lastUpdated: String
    let tickers: [CoinsIdTicker]
}

struct CoinsIdLocalizationDescription: Codable {
    let en: String
    let de: String
    let es: String
    let fr: String
    let it: String
    let pl: String
    let ro: String
    let hu: String
    let nl: String
    let pt: String
    let sv: String
    let vi: String
    let tr: String
    let ru: String
    let ja: String
    let zh: String
    let zhTw: String
    let ko: String
    let ar: String
    let th: String
    let id: String

    enum CodingKeys: String, CodingKey {
        case en, de, es, fr, it, pl, ro, hu, nl, pt, sv, vi, tr, ru, ja, zh
        case zhTw = "zh-tw"
        case ko, ar, th, id
    }
}

struct CoinsIdCommunityData: Codable {
    let facebookLikes: Int?
    let twitterFollowers: Int
    let redditAveragePosts48H: Int
    let redditAverageComments48H: Double
    let redditSubscribers: Int
    let redditAccountsActive48H: Int
    let telegramChannelUserCount: Int?
}

struct CoinsIdDeveloperData: Codable {
    let forks: Int
    let stars: Int
    let subscribers: Int
    let totalIssues: Int
    let closedIssues: Int
    let pullRequestsMerged: Int
    let pullRequestContributors: Int
    let codeAdditionsDeletions4Weeks: CoinsIdCodeAdditionsDeletions4Weeks
    let commitCount4Weeks: Int
    let last4WeeksCommitActivitySeries: [Int]
}

struct CoinsIdCodeAdditionsDeletions4Weeks: Codable {
    let additions: Int
    let deletions: Int
}

struct CoinsIdImage: Codable {
    let thumb: String
    let small: String
    let large: String
}

struct  CoinsIdLinks: Codable {
    let homepage: [String]
    let blockchainSite: [String]
    let officialForumUrl: [String]
    let chatUrl: [String]
    let announcementUrl: [String]
    let twitterScreenName: String
    let facebookUsername: String
    let bitcointalkThreadIdentifier: String?
    let telegramChannelIdentifier: String
    let subredditUrl: String
    let reposUrl: CoinsIdReposURL
}

struct CoinsIdReposURL: Codable {
    let github: [String?]
    let bitbucket: [String?]
}

struct CoinsIdMarketData: Codable {
    let currentPrice: [String: Double]
    let totalValueLocked: Int?
    let mcapToTvlRatio: Int?
    let fdvToTvlRatio: Int?
    let roi: Int?
    let ath: [String: Double]
    let athChangePercentage: [String: Double]
    let athDate: [String: Date]
    let atl: [String: Double]
    let atlChangePercentage: [String: Double]
    let atlDate: [String: Date]
    let marketCap: [String: Double]
    let marketCapRank: Int
    let fullyDilutedValuation: [String: Double]
    let totalVolume: [String: Double]
    let high24H: [String: Double]
    let low24H: [String: Double]
    let priceChange24H: Double
    let priceChangePercentage24H: Double
    let priceChangePercentage7D: Double
    let priceChangePercentage14D: Double
    let priceChangePercentage30D: Double
    let priceChangePercentage60D: Double
    let priceChangePercentage200D: Double
    let priceChangePercentage1Y: Double
    let marketCapChange24H: Double
    let marketCapChangePercentage24H: Double
    let priceChange24HInCurrency: [String: Double]
    let priceChangePercentage1HInCurrency: [String: Double]
    let priceChangePercentage24HInCurrency: [String: Double]
    let priceChangePercentage7DInCurrency: [String: Double]
    let priceChangePercentage14DInCurrency: [String: Double]
    let priceChangePercentage30DInCurrency: [String: Double]
    let priceChangePercentage60DInCurrency: [String: Double]
    let priceChangePercentage200DInCurrency: [String: Double]
    let priceChangePercentage1YInCurrency: [String: Double]
    let marketCapChange24HInCurrency: [String: Double]
    let marketCapChangePercentage24HInCurrency: [String: Double]
    let totalSupply: Int
    let maxSupply: Int
    let circulatingSupply: Int
    let lastUpdated: Date

}

struct CoinsIdPlatforms: Codable {
    let empty: String

    enum CodingKeys: String, CodingKey {
        case empty = ""
    }
}

struct CoinsIdPublicInterestStats: Codable {
    let alexaRank: Int
    let bingMatches: Int?
}

struct CoinsIdTicker: Codable {
    let base: String
    let target: String
    let market: CoinsIdMarket
    let last: Double
    let volume: Double
    let convertedLast: [String: Double]
    let convertedVolume: [String: Double]
    let trustScore: CoinsIdTrustScore
    let bidAskSpreadPercentage: Double
    let timestamp: Date?
    let lastTradedAt: Date?
    let lastFetchAt: Date?
    let isAnomaly: Bool
    let isStale: Bool
    let tradeUrl: String?
    let tokenInfoUrl: String?
    let coinId: String
    let targetCoinId: String?
}

struct CoinsIdMarket: Codable {
    let name: String
    let identifier: String
    let hasTradingIncentive: Bool
}

enum CoinsIdTrustScore: String, Codable {
    case green = "green"
}
