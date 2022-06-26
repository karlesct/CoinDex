//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

/// List all asset platforms
struct AssetPlatformsRequest: Requestable {

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
    
}

extension AssetPlatformsRequest: ResponseDecoder {
    
    func decode(_ data: Data) throws -> AssetPlatformsResponseArray {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(AssetPlatformsResponseArray.self, from: data)
        return response
    }
}
