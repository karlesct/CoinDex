//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

struct GlobalDecentralizedFinanceDefiRequest: DataRequest {

    let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL
    }

    var url: String {
        return baseURL + path
    }

    var path: String {
        return "/global/decentralized_finance_defi"
    }

    var headers: [HTTPHeaderKey: HTTPHeaderValue] {
        [
            .accept: .applicationJson
        ]
    }

    var method: HTTPMethod {
        .get
    }

    func decode(_ data: Data) throws -> DataCodable<GlobalDecentralizedFinanceDefiResponse> {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(DataCodable<GlobalDecentralizedFinanceDefiResponse>.self, from: data)
        return response
    }
}

