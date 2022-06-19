//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

/// List all exchanges
struct ExchangesRequest: DataRequest {

    let baseURL: String
    let page: Int
    let perPage: Int

    init(baseURL: String,
         page: Int,
         perPage: Int = 100) {
        self.baseURL = baseURL
        self.page = page
        self.perPage = perPage
    }

    var url: String {
        return baseURL + path
    }

    var path: String {
        return "/exchanges"
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
            "per_page" : "\(self.perPage)",                // Valid values: 1...250 | Total results per page | Default value: 100
            "page" : "\(self.page)",                     // page through results. Max: 6
        ]
    }

    func decode(_ data: Data) throws -> ExchangesResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(ExchangesResponse.self, from: data)
        return response
    }
}
