//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

/// List all categories with market data
struct CategoriesRequest: Requestable {

    let baseURL: String
    let order: CategoriesRequestOrderEnum
    
    init(baseURL: String,
         order: CategoriesRequestOrderEnum) {
        self.baseURL = baseURL
        self.order = order
    }

    var url: String {
        return baseURL + path
    }

    var path: String {
        return "/coins/categories"
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
            "order" : order.rawValue              // market_cap_desc (default), market_cap_asc, name_desc, name_asc, market_cap_change_24h_desc and market_cap_change_24h_asc
        ]
    }

    func decode(_ data: Data) throws -> CategoriesResponseArray {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(CategoriesResponseArray.self, from: data)
        return response
    }
}

enum CategoriesRequestOrderEnum: String {
    case marketCapDesc = "market_cap_desc"
    case marketCapAsc = "market_cap_asc"
    case nameDesc = "name_desc"
    case nameAsc = "name_asc"
    case marketCapChange24hDesc = "market_cap_change_24h_desc"
    case marketCapChange24hAsc = "market_cap_change_24h_asc"
}
