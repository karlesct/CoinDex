//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

typealias DerivativesExchangeResponseArray = [DerivativesExchangeResponse]

struct DerivativesExchangeResponse: Codable {
    let name: String
    let id: String
    let openInterestBtc: Double?
    let tradeVolume24HBtc: String
    let numberOfPerpetualPairs: Int
    let numberOfFuturesPairs: Int
    let image: String
    let yearEstablished: Int?
    let country: String?
    let companiesResponseDescription: String?
    let url: String
}
