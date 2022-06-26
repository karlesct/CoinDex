//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

/// List all derivative exchanges
struct DerivativesExchangesRequest: Requestable {

    let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL
    }

    var url: String {
        return baseURL + path
    }

    var path: String {
        return "/derivatives/exchanges"
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
            "order" : "unexpired",              // order results using following params name_asc，name_desc，open_interest_btc_asc，open_interest_btc_desc，trade_volume_24h_btc_asc，trade_volume_24h_btc_desc
            "per_page" : "10",                  // Total results per page
            "page" : "1",                       // Page through results
        ]
    }
}

extension DerivativesExchangesRequest: ResponseDecoder {
    
    func decode(_ data: Data) throws -> DerivativesExchangeResponseArray {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(DerivativesExchangeResponseArray.self, from: data)
        return response
    }
}
