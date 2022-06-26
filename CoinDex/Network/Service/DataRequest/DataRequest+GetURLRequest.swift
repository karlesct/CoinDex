//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

enum RequestGenerationError: Error {
    case components
}

extension Requestable {
    func getURLRequest() throws -> URLRequest {
        guard var urlComponents = URLComponents(string: self.url)
        else { throw RequestGenerationError.components }
        
        var queryItems: [URLQueryItem] = []
        
        self.queryItems?.forEach {
            let urlQueryItem = URLQueryItem(name: $0.key,
                                            value: $0.value)
            queryItems.append(urlQueryItem)
        }
        
        urlComponents.queryItems = !queryItems.isEmpty ? queryItems : nil
        
        guard let url = urlComponents.url
        else { throw RequestGenerationError.components }
        
        var request = URLRequest(url: url)
        request.httpMethod = self.method.rawValue
        self.headers?.forEach { request.addValue($1.rawValue,
                                                 forHTTPHeaderField: $0.rawValue)}
        request.httpBody = self.body
        return request
    }
}
