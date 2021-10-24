//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

extension URLRequest {

    class Builder {

        // MARK: - Properties

        private var scheme: String?
        private var host: String?
        private var path: String?
        private var headers:  [HTTPHeaderKey: HTTPHeaderValue]?
        private var queryItems: [URLQueryItem]?
        private var httpMethod: HTTPMethod = .get
        private var body: Data?

        // MARK: - Init

        init() {
        }

        // MARK: - Methods

        func scheme(_ scheme: String) -> Builder {

            self.scheme = scheme
            return self
        }

        func host(_ host: String) -> Builder {

            self.host = host
            return self
        }

        func path(_ path: String?) -> Builder {

            self.path = path
            return self
        }

        func headers(_ headers: [HTTPHeaderKey: HTTPHeaderValue]?) -> Builder {

            self.headers = headers
            return self
        }

        func queryItems(_ queryItems: [URLQueryItem]?) -> Builder {
            self.queryItems = queryItems
            return self
        }

        func httpMethod(_ httpMethod: HTTPMethod) -> Builder {

            self.httpMethod = httpMethod
            return self
        }

        func body(_ body: Data?) -> Builder {

            self.body = body
            return self
        }

        var url: URL? {
            var components = URLComponents()
            components.scheme = self.scheme
            components.host = self.host
            components.path = self.path ?? .empty
            components.queryItems = self.queryItems

            return components.url
        }


        func build() -> URLRequest? {


            guard let url = self.url
            else {
                return nil
            }

            var request = URLRequest(url: url)
            request.httpMethod = self.httpMethod.rawValue

            headers?.forEach { request.addValue($1.rawValue,
                                                forHTTPHeaderField: $0.rawValue)}

            request.httpBody = self.body

            return request

        }

    }

}
