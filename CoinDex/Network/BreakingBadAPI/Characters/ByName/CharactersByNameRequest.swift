//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

/// Request characters by category, like 'Breaking Bad' or 'Better Call Saul'.
struct CharactersByNameRequestRequest: Requestable {

    let baseURL: String
    let name: String

    init(baseURL: String,
         name: String) {
        self.baseURL = baseURL
        self.name = name
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
            "name" : "\(self.name)"
        ]
    }
}

extension CharactersByNameRequestRequest: ResponseDecoder {
    
    func decode(_ data: Data) throws -> CharactersResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(CharactersResponse.self, from: data)
        return response
    }
}

