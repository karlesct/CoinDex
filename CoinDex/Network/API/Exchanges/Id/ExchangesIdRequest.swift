//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

/// Get exchange volume in BTC and top 100 tickers only
/// IMPORTANT:
/// Ticker object is limited to 100 items, to get more tickers, use /exchanges/{id}/tickers
/// Ticker is_stale is true when ticker that has not been updated/unchanged from the exchange for a while.Ticker is_anomaly is true if ticker's price is outliered by our system.
/// You are responsible for managing how you want to display these information (e.g. footnote, different background, change opacity, hide)
struct ExchangesIdRequest: DataRequest {

    let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL
    }

    var url: String {
        return baseURL + path
    }

    var path: String {
        return "/exchanges/binance"
    }

    var headers: [HTTPHeaderKey: HTTPHeaderValue] {
        [
            .accept: .applicationJson
        ]
    }

    var method: HTTPMethod {
        .get
    }
    
    func decode(_ data: Data) throws -> ExchangesIdResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        let response = try decoder.decode(ExchangesIdResponse.self, from: data)
        return response
    }
}
