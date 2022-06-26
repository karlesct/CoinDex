//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

/// List all supported coins price, market cap, volume, and market related data
struct CoinsMarketsRequest: Requestable {

    let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL
    }

    var url: String {
        return baseURL + path
    }

    var path: String {
        return "/coins/markets"
    }

    var headers: [HTTPHeaderKey: HTTPHeaderValue] {
        [
            .accept: .applicationJson
        ]
    }

    var method: HTTPMethod {
        .get
    }

    var queryItems: [String : String]? {
        [
            "vs_currency" : "eur",                // the target currency of market data (usd, eur, jpy, etc.)
            "id" : "bitcoin",              // The ids of the coin, comma separated crytocurrency symbols (base). refers to /coins/list.
                                        // When left empty, returns numbers the coins observing the params limit and start
            "category" : "10",                     // filter by coin category. Refer to /coin/categories/list
            "order" : "market_cap_desc",           // valid values: market_cap_desc, gecko_desc, gecko_asc, market_cap_asc, market_cap_desc, volume_asc, volume_desc, id_asc, id_desc
                                                    // sort results by field. | Default value : market_cap_desc
            "per_page" : "100",                     // valid values: 1..250 | Total results per page | Default value : 100
            "page" : "1",                     // Page through results |  Default value : 1
            "sparkline" : "1",                     // Include sparkline 7 days data (eg. true, false) |  Default value : false
            "price_change_percentage" : "1",                     // Include price change percentage in 1h, 24h, 7d, 14d, 30d, 200d, 1y (eg. '1h,24h,7d' comma-separated, invalid values will be discarded)
        ]
    }

    func decode(_ data: Data) throws -> CoinsMarketsResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(.yyyyMMddTHHmmssSSSZ)
        let response = try decoder.decode(CoinsMarketsResponse.self, from: data)
        return response
    }
}
