//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

typealias CategoriesResponseArray = [CategoriesResponse]

struct CategoriesResponse: Codable {
    let id, name: String
    let marketCap: Double
    let marketCapChange24H: Double
    let content: String?
    let top3Coins: [String]
    let volume24H: Double
    let updatedAt: String
}
