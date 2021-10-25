//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

struct GlobalDecentralizedFinanceDefiResponse: Codable {
    let defiMarketCap: String
    let ethMarketCap: String
    let defiToEthRatio: String
    let tradingVolume24H: String
    let defiDominance: String
    let topCoinName: String
    let topCoinDefiDominance: Double
}
