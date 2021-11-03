//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

/// Get volume_chart data for a given exchange
struct ExchangesIdVolumeChartRequest: DataRequest {

    let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL
    }

    var url: String {
        return baseURL + path
    }

    var path: String {
        return "/exchanges/binance/volume_chart"
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
            "days" : "15",              // Data up to number of days ago (eg. 1, 14, 30)
        ]
    }

    func decode(_ data: Data) throws -> ExchangesIdVolumeChartResponse {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        let response = try decoder.decode(ExchangesIdVolumeChartResponse.self, from: data)
        return response
    }
}
