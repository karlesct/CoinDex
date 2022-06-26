//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

/// Get Top 100 Cryptocurrency Global Eecentralized Finance(defi) data
struct GlobalDecentralizedFinanceDefiRequest: Requestable {

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
    
}

extension GlobalDecentralizedFinanceDefiRequest: ResponseDecoder {
    
    func decode(_ data: Data) throws -> DataItemCodable<GlobalDecentralizedFinanceDefiResponse> {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(DataItemCodable<GlobalDecentralizedFinanceDefiResponse>.self, from: data)
        return response
    }
}

