//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

/// Top-7 trending coins as searched by users in the last 24 hours (Ordered by most popular first)
struct TrendingRequest: DataRequest {

    let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL
    }

    var url: String {
        return baseURL + path
    }

    var path: String {
        return "/search/trending"
    }

    var headers: [HTTPHeaderKey: HTTPHeaderValue] {
        [
            .accept: .applicationJson
        ]
    }

    var method: HTTPMethod {
        .get
    }

    func decode(_ data: Data) throws -> TrendingResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(TrendingResponse.self, from: data)
        return response
    }
}
