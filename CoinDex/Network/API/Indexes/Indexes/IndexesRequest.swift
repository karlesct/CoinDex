//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

/// List all market indexes
struct IndexesRequest: DataRequest {

    let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL
    }

    var url: String {
        return baseURL + path
    }

    var path: String {
        return "/indexes"
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
            "per_page" : "10",              // Total results per page
            "page" : "1"                    // Page through results

        ]
    }

    func decode(_ data: Data) throws -> IndexesResponseArray {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(IndexesResponseArray.self, from: data)
        return response
    }
}
