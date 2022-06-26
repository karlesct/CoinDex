//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

/// Get public companies bitcoin or ethereum holdings (Ordered by total holdings descending)
struct CompaniesRequest: Requestable {

    let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL
    }

    var url: String {
        return baseURL + path
    }

    var path: String {
        return "/companies/public_treasury/bitcoin"
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
            "coin_id" : "bitcoin"          // bitcoin or ethereum
        ]
    }
    
}

extension CompaniesRequest: ResponseDecoder {
    
    func decode(_ data: Data) throws -> CompaniesResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(CompaniesResponse.self, from: data)
        return response
    }
}
