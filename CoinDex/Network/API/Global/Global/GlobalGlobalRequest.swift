//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

/// Get cryptocurrency global data
struct GlobalGlobalRequest: DataRequest {

    let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL
    }

    var url: String {
        return baseURL + path
    }

    var path: String {
        return "/global"
    }

    var headers: [HTTPHeaderKey: HTTPHeaderValue] {
        [
            .accept: .applicationJson
        ]
    }

    var method: HTTPMethod {
        .get
    }

    func decode(_ data: Data) throws -> DataItemCodable<GlobalGlobalResponse> {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(DataItemCodable<GlobalGlobalResponse>.self, from: data)
        return response
    }
}

