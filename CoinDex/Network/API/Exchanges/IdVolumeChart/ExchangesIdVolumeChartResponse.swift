//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

typealias ExchangesIdVolumeChartResponse = [ExchangesIdVolumeChartResponseElement]

struct ExchangesIdVolumeChartResponseElement: Codable {
    let date: Date?
    let value: String?

    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        date = try container.decode(Date.self)
        value = try container.decode(String.self)
    }
}
