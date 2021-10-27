//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

struct CompaniesResponse: Codable {
    let totalHoldings: Double
    let totalValueUsd: Double
    let marketCapDominance: Double
    let companies: [CompanyItem]
}

// MARK: - Company
struct CompanyItem: Codable {
    let name: String
    let symbol: String
    let country: String
    let totalHoldings: Int
    let totalEntryValueUsd: Int
    let totalCurrentValueUsd: Int
    let percentageOfTotalSupply: Double
}
