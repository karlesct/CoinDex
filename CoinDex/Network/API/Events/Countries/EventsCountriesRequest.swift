//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

/// Get list of event countries
struct EventsCountriesRequest: DataRequest {

    let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL
    }

    var url: String {
        return baseURL + path
    }

    var path: String {
        return "/events/countries"
    }

    var headers: [HTTPHeaderKey: HTTPHeaderValue] {
        [
            .accept: .applicationJson
        ]
    }

    var method: HTTPMethod {
        .get
    }

    func decode(_ data: Data) throws -> DataArrayCodable<EventsCountriesResponse> {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(DataArrayCodable<EventsCountriesResponse>.self, from: data)
        return response
    }
}
