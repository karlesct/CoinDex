//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

import Foundation

struct FinancePlatformsRequest: DataRequest {

    var url: String {
        let baseURL: String = "https://api.coingecko.com/api/v3"
        return baseURL + path
    }

    var path: String {
        return "/finance_platforms"
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
            "per_page" : "100"
        ]
    }

    func decode(_ data: Data) throws -> FinancePlatformsResponseArray {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(FinancePlatformsResponseArray.self, from: data)
        return response
    }
}
