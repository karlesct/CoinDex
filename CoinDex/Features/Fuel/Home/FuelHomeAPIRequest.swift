//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

struct FuelHomeAPIRequest: DataRequest {

    let baseURL: String

    init(baseURL: String = "https://sedeaplicaciones.minetur.gob.es") {
        self.baseURL = baseURL
    }

    var url: String {
        return baseURL + path
    }

    var path: String {
        return "/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/"
    }

    var headers: [HTTPHeaderKey: HTTPHeaderValue] {
        [
            .accept: .applicationJson
        ]
    }

    var method: HTTPMethod {
        .get
    }

    func decode(_ data: Data) throws -> FuelHomeAPIResponse {
        let decoder = JSONDecoder()
        let response = try decoder.decode(FuelHomeAPIResponse.self, from: data)
        return response
    }
}

