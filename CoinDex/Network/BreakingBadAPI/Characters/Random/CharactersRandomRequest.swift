//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

/// Request a random character
struct CharactersRandomRequest: Requestable {

    let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL
    }

    var url: String {
        return baseURL + path
    }

    var path: String {
        return "/characters/random"
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

extension CharactersRandomRequest: ResponseDecoder {
    
    func decode(_ data: Data) throws -> CharactersResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(CharactersResponse.self, from: data)
        return response
    }
}


