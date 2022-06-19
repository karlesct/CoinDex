//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

// MARK: - SearchResponse
struct SearchResponse: Codable {
    let coins: [Coin]
    let exchanges: [Exchange]
    let categories: [Category]
    let nfts: [Nft]
}

// MARK: - Category
struct Category: Codable {
    let id: Int
    let name: String
}

// MARK: - Coin
struct Coin: Codable {
    let id: String
    let name: String
    let symbol: String
    let marketCapRank: Int
    let thumb: String
    let large: String
}

// MARK: - Exchange
struct Exchange: Codable {
    let id: String
    let name: String
    let marketType: String
    let thumb: String
    let large: String
}

// MARK: - Nft
struct Nft: Codable {
    let id: String
    let name: String
    let symbol: String
    let thumb: String
}
