//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

/// Request characters by category, like 'Breaking Bad' or 'Better Call Saul'.
struct CharactersByCategoryRequest: Requestable {

    let baseURL: String
    let category: CharactersCategory

    init(baseURL: String,
         category: CharactersCategory) {
        self.baseURL = baseURL
        self.category = category
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
            "category" : "\(self.category.rawValue)"
        ]
    }
}

extension CharactersByCategoryRequest: ResponseDecoder {
    
    func decode(_ data: Data) throws -> CharactersResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(CharactersResponse.self, from: data)
        return response
    }
}
