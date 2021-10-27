//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

typealias DerivativesResponseArray = [DerivativesResponse]

struct DerivativesResponse: Codable {
    let market: String
    let symbol: String
    let indexId: String
    let price: String?
    let pricePercentageChange24H: Double
    let contractType: String
    let index: Double?
    let basis: Double
    let spread: Double?
    let fundingRate: Double
    let openInterest: Double?
    let volume24H: Double
    let lastTradedAt: Int
    let expiredAt: Int?
}
