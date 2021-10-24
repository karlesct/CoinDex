//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

struct CoinsListRequest: DataRequest {

    var url: String {
        let baseURL: String = "https://api.coingecko.com/api/v3"
        return baseURL + path
    }

    var path: String {
        return "/coins/list"
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
            "include_platform" : "true"
        ]
    }

    func decode(_ data: Data) throws -> CoinsListResponseArray {
        let decoder = JSONDecoder()

        let response = try decoder.decode(CoinsListResponseArray.self, from: data)
        return response
    }
}
