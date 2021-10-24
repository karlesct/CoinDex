//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

struct PingRequest: DataRequest {

    var url: String {
        let baseURL: String = "https://api.coingecko.com/api/v3"
        return baseURL
    }

    var path: String {
        return "/ping"
    }

    var queryItems: [HTTPHeaderKey: HTTPHeaderValue] {
        [
            .accept: .applicationJson
        ]
    }

    var method: HTTPMethod {
        .get
    }

    func decode(_ data: Data) throws -> PingResponse {
        let decoder = JSONDecoder()

        let response = try decoder.decode(PingResponse.self, from: data)
        return response
    }
}
