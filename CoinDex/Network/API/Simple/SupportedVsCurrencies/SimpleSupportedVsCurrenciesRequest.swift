//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

/// Get list of supported_vs_currencies
struct SimpleSupportedVsCurrenciesRequest: DataRequest {

    let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL
    }

    var url: String {
        return baseURL + path
    }

    var path: String {
        return "/simple/supported_vs_currencies"
    }

    var headers: [HTTPHeaderKey: HTTPHeaderValue] {
        [
            .accept: .applicationJson
        ]
    }

    var method: HTTPMethod {
        .get
    }

    func decode(_ data: Data) throws -> SimpleSupportedVsCurrenciesResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(SimpleSupportedVsCurrenciesResponse.self, from: data)
        return response
    }
}
