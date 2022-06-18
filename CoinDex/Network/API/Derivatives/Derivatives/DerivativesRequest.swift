//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

/// List all derivative tickers
struct DerivativesRequest: DataRequest {

    let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL
    }

    var url: String {
        return baseURL + path
    }

    var path: String {
        return "/derivatives"
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
            "include_tickers" : "unexpired"           // ['all', 'unexpired'] - expired to show unexpired tickers, all to list all tickers, defaults to unexpired
        ]
    }

    func decode(_ data: Data) throws -> DerivativesResponseArray {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(DerivativesResponseArray.self, from: data)
        return response
    }
}
