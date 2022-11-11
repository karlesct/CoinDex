//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

/// Use a query parameter to limit the amount of characters you receive, and to offset the starting number. Consider the following request.
struct CharactersLimitAndOffsetRequest: Requestable {

    let baseURL: String
    let limit: Int
    let offset: Int

    init(baseURL: String,
         limit: Int = 10,
         offset: Int) {
        self.baseURL = baseURL
        self.limit = limit
        self.offset = offset
    }

    var url: String {
        return baseURL + path
    }

    var path: String {
        return "/characters"
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
            "limit" : "\(self.limit)",
            "offset" : "\(self.offset)",
        ]
    }
}

extension CharactersLimitAndOffsetRequest: ResponseDecoder {
    
    func decode(_ data: Data) throws -> CharactersResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(CharactersResponse.self, from: data)
        return response
    }
}
