//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

typealias FinancePlatformsResponseArray = [FinancePlatformsResponse]

struct FinancePlatformsResponse: Codable {
    let name: String
    let facts: String
    let category: FinancePlatformsCategory
    let centralized: Bool
    let websiteUrl: String
}

enum FinancePlatformsCategory: String, Codable {
    case ceFiPlatform = "CeFi Platform"
    case deFiPlatform = "DeFi Platform"
}
