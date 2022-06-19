//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

/// Use this to obtain all the coins' id in order to make API calls
struct CoinsListRequest: DataRequest {

    let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL
    }

    var url: String {
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
            "include_platform" : "true" //flag to include platform contract addresses (eg. 0x.... for Ethereum based tokens). valid values: true, false
        ]
    }

    func decode(_ data: Data) throws -> CoinsListResponseArray {
        let decoder = JSONDecoder()

        let response = try decoder.decode(CoinsListResponseArray.self, from: data)
        return response
    }
}
