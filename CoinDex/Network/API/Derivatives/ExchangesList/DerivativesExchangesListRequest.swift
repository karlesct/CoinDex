//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

/// List all derivative exchanges name and identifier
struct DerivativesExchangesListRequest: DataRequest {

    let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL
    }

    var url: String {
        return baseURL + path
    }

    var path: String {
        return "/derivatives/exchanges/list"
    }

    var headers: [HTTPHeaderKey: HTTPHeaderValue] {
        [
            .accept: .applicationJson
        ]
    }

    var method: HTTPMethod {
        .get
    }

    func decode(_ data: Data) throws -> DerivativesExchangesListResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(DerivativesExchangesListResponse.self, from: data)
        return response
    }
}
