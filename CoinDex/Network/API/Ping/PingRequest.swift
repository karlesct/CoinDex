//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

/// Check API server status
struct PingRequest: Requestable {

    let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL
    }

    var url: String {
        return baseURL + path
    }

    var path: String {
        return "/ping"
    }

    var headers: [HTTPHeaderKey: HTTPHeaderValue] {
        [
            .accept: .applicationJson
        ]
    }

    var method: HTTPMethod {
        .get
    }
    
}

extension PingRequest: ResponseDecoder {
    
    func decode(_ data: Data) throws -> PingResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(PingResponse.self, from: data)
        return response
    }
}
