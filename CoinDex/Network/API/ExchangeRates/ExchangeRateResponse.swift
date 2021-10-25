//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

struct ExchangeRateResponse: Codable {
    let rates: [String: ExchangeRateRate]

}

// MARK: - Coin
struct ExchangeRateRate: Codable {
    let name, unit: String
        let value: Double
        let type: ExchangeRateTypeEnum
}

enum ExchangeRateTypeEnum: String,
                           Codable {

    case commodity = "commodity"
    case crypto = "crypto"
    case fiat = "fiat"
}
