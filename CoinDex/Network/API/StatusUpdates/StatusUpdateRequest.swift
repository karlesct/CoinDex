//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

/// List all status_updates with data (description, category, created_at, user, user_title and pin)
struct StatusUpdateRequest: DataRequest {

    let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL
    }

    var url: String {
        return baseURL + path
    }

    var path: String {
        return "/status_updates"
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
            "category" : "general",                // Filtered by category (eg. general, milestone, partnership, exchange_listing, software_release, fund_movement, new_listings, event)
            "project_type" : "coin",              // Filtered by Project Type (eg. coin, market). If left empty returns both status from coins and markets.
            "per_page" : "10",                     // Total results per page
            "page" : "1",                          // Page through results
        ]
    }

    func decode(_ data: Data) throws -> StatusUpdateResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(StatusUpdateResponse.self, from: data)
        return response
    }
}
