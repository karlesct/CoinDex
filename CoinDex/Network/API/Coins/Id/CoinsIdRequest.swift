//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

/// Get current data (name, price, market, ... including exchange tickers) for a coin
/// IMPORTANT:
/// Ticker object is limited to 100 items, to get more tickers, use /coins/{id}/tickers
/// Ticker is_stale is true when ticker that has not been updated/unchanged from the exchange for a while.
/// Ticker is_anomaly is true if ticker's price is outliered by our system.
/// You are responsible for managing how you want to display these information (e.g. footnote, different background, change opacity, hide)
struct CoinsIdRequest: Requestable {

    let baseURL: String
    let id: String

    init(baseURL: String,
         id: String) {
        self.baseURL = baseURL
        self.id = id
    }

    var url: String {
        return baseURL + path
    }

    var path: String {
        return "/coins/\(self.id)"
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
            //"id" : "bitcoin",              // pass the coin id (can be obtained from /coins) eg. bitcoin
            "localization" : "true",                     // Include all localized languages in response (true/false) [default: true]
            "tickers" : "true",           // Include tickers data (true/false) [default: true]
            "market_data" : "true",                     // Include market_data (true/false) [default: true]
            "community_data" : "true",                     // Include community_data data (true/false) [default: true]
            "developer_data" : "true",                     // Include developer_data data (true/false) [default: true]
            "sparkline" : "true",                     // Include sparkline 7 days data (eg. true, false) [default: false]
        ]
    }

    func decode(_ data: Data) throws -> CoinsIdResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.setDateDecodingStrategyFormatters([
            .yyyyMMddTHHmmssZ,
            .yyyyMMddTHHmmssSSSZ
        ])
        let response = try decoder.decode(CoinsIdResponse.self, from: data)
        return response
    }
}
