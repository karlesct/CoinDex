//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

/// List all market indexes
struct IndexesListRequest: DataRequest {

    let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL
    }

    var url: String {
        return baseURL + path
    }

    var path: String {
        return "/indexes/list"
    }

    var headers: [HTTPHeaderKey: HTTPHeaderValue] {
        [
            .accept: .applicationJson
        ]
    }

    var method: HTTPMethod {
        .get
    }

    func decode(_ data: Data) throws -> IndexesListResponseArray {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(IndexesListResponseArray.self, from: data)
        return response
    }
}
