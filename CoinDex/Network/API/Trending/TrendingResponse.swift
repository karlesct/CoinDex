//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

struct TrendingResponse: Codable {
    let coins: [TrendingCoin]

}

// MARK: - Coin
struct TrendingCoin: Codable {
    let item: TrendingItem
}

// MARK: - Item
struct TrendingItem: Codable {
    let id: String
    let coinId: Int
    let name: String
    let symbol: String
    let marketCapRank: Int
    let thumb: String
    let small: String
    let large: String
    let slug: String
    let priceBtc: Double
    let score: Int
}
