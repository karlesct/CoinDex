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

        func with(scheme: String) -> Builder {
            self.scheme = scheme
            return self
        }

        func with(host: String) -> Builder {

            self.host = host
            return self
        }

        func with(path: String?) -> Builder {

            self.path = path
            return self
        }

        func with(headers: [HTTPHeaderKey: HTTPHeaderValue]?) -> Builder {

            self.headers = headers
            return self
        }

        func with(queryItems: [URLQueryItem]?) -> Builder {
            self.queryItems = queryItems
            return self
        }

        func with(httpMethod: HTTPMethod) -> Builder {

            self.httpMethod = httpMethod
            return self
        }

        func with(body: Data?) -> Builder {

            self.body = body
            return self
        }

        lazy var url: URL? = {
            var components = URLComponents()
            components.scheme = self.scheme
            components.host = self.host
            components.path = self.path ?? .empty
            components.queryItems = self.queryItems

            return components.url
        }()


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
