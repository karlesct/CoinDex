//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

/// Show derivative exchange data
struct DerivativesExchangeIdRequest: DataRequest {

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
        return "/derivatives/exchanges/\(self.id)"
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
            "include_tickers" : "unexpired"              // ['all', 'unexpired'] - expired to show unexpired tickers, all to list all tickers, leave blank to omit tickers data in response
        ]
    }

    func decode(_ data: Data) throws -> DerivativesExchangeIdResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(DerivativesExchangeIdResponse.self, from: data)
        return response
    }
}
