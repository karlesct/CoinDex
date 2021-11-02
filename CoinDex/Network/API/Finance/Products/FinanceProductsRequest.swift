//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

/// List all finance products
struct FinanceProductsRequest: DataRequest {

    let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL
    }

    var url: String {
        return baseURL + path
    }

    var path: String {
        return "/finance_products"
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
            "per_page" : "10",               // Total results per page
            "page" : "1",                    // page of results (paginated to 100 by default)
//            "start_at" : "2019-10-30",       // start date of the financial products
//            "end_at" : "2020-09-01"          // end date of the financial products
        ]
    }

    func decode(_ data: Data) throws -> FinanceProductsResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(FinanceProductsResponse.self, from: data)
        return response
    }
}
