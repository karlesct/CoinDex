//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

typealias FinanceProductsResponse = [FinanceProductsResponseElement]

struct FinanceProductsResponseElement: Codable {
    let platform: String
    let identifier: String
    let supplyRatePercentage: String
    let borrowRatePercentage: String?
    let startAt: Int
    let endAt: Int
    let valueAt: Int
    let redeemAt: Int
}
