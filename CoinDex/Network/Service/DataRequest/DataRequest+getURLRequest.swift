//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

extension DataRequest {
    func getURLRequest(_ baseURL: URL) -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        headers?.forEach { request.addValue($1.rawValue,
                                            forHTTPHeaderField: $0.rawValue)}
        request.httpBody = body
        return request
    }
}
