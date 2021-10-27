//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

/// Show derivative exchange data
struct ExchangeDataRequest: DataRequest {

    let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL
    }

    var url: String {
        return baseURL + path
    }

    var path: String {
        return "/derivatives/exchanges/bitmex"
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
            "include_tickers" : "unexpired",              // ['all', 'unexpired'] - expired to show unexpired tickers, all to list all tickers, leave blank to omit tickers data in response
        ]
    }

    func decode(_ data: Data) throws -> ExchangeDataResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(ExchangeDataResponse.self, from: data)
        return response
    }
}
