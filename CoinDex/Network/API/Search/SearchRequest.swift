//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

import Foundation

/// Search for coins, categories and markets listed on CoinGecko ordered by largest Market Cap first
struct SearchRequest: DataRequest {

    let baseURL: String
    let query: String

    init(baseURL: String,
         query: String) {
        self.baseURL = baseURL
        self.query = query
    }

    var url: String {
        return baseURL + path
    }

    var path: String {
        return "/search"
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
            "query" : self.query               // Search string
        ]
    }

    func decode(_ data: Data) throws -> SearchResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(SearchResponse.self, from: data)
        return response
    }
}

