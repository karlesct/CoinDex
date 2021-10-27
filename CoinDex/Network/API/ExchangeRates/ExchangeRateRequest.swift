//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

/// Get BTC-to-Currency exchange rates
struct ExchangeRateRequest: DataRequest {

    let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL
    }

    var url: String {
        return baseURL + path
    }

    var path: String {
        return "/exchange_rates"
    }

    var headers: [HTTPHeaderKey: HTTPHeaderValue] {
        [
            .accept: .applicationJson
        ]
    }

    var method: HTTPMethod {
        .get
    }

    func decode(_ data: Data) throws -> ExchangeRateResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(ExchangeRateResponse.self, from: data)
        return response
    }
}

