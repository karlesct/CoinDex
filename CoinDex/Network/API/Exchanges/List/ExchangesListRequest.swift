//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

/// List all supported markets id and name (no pagination required)
/// Use this to obtain all the markets' id in order to make API calls
struct ExchangesListRequest: DataRequest {

    let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL
    }

    var url: String {
        return baseURL + path
    }

    var path: String {
        return "/exchanges/list"
    }

    var headers: [HTTPHeaderKey: HTTPHeaderValue] {
        [
            .accept: .applicationJson
        ]
    }

    var method: HTTPMethod {
        .get
    }

    func decode(_ data: Data) throws -> ExchangesListResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(ExchangesListResponse.self, from: data)
        return response
    }
}
