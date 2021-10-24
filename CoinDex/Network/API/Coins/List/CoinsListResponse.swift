//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

typealias CoinsListResponseArray = [CoinsListResponse]

struct CoinsListResponse: Codable {
    let id: String
    let symbol: String
    let name: String
    let platforms: CoinsListPlatforms?
}

struct CoinsListPlatforms: Codable {
    let xdai: String?
    let ethereum: String?
}
