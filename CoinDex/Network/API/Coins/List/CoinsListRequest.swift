//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

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
            "include_platform" : "true"
        ]
    }

    func decode(_ data: Data) throws -> CoinsListResponseArray {
        let decoder = JSONDecoder()

        let response = try decoder.decode(CoinsListResponseArray.self, from: data)
        return response
    }
}
