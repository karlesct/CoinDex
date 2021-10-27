//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

/// List all asset platforms
struct AssetPlatformsRequest: DataRequest {

    let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL
    }

    var url: String {
        return baseURL + path
    }

    var path: String {
        return "/asset_platforms"
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
            "include_platform" : "true"
        ]
    }

    func decode(_ data: Data) throws -> AssetPlatformsResponseArray {
        let decoder = JSONDecoder()

        let response = try decoder.decode(AssetPlatformsResponseArray.self, from: data)
        return response
    }
}
