//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

/// List all market indexes
struct IndexesRequest: Requestable {

    let baseURL: String
    let perPage: Int
    let page: Int

    init(baseURL: String,
         perPage: Int,
         page: Int) {
        self.baseURL = baseURL
        self.perPage = perPage
        self.page = page
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
            "per_page" : "\(self.perPage)",              // Total results per page
            "page" : "\(self.page)"                    // Page through results

        ]
    }

    func decode(_ data: Data) throws -> IndexesResponseArray {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(IndexesResponseArray.self, from: data)
        return response
    }
}
