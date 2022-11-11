//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

/// Get single character
struct CharactersSingleRequest: Requestable {

    let baseURL: String
    let id: String

    init(baseURL: String,
         id: String) {
        self.baseURL = baseURL
        self.id = id
    }

    var url: String {
        return baseURL + path
    }

    var path: String {
        return "/characters/\(self.id)"
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

extension CharactersSingleRequest: ResponseDecoder {
    
    func decode(_ data: Data) throws -> CharactersResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(CharactersResponse.self, from: data)
        return response
    }
}


