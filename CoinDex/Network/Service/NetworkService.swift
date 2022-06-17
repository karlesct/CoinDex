//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation


protocol NetworkServiceProtocol {
    func request<Request: DataRequest>(_ request: Request, completion: @escaping (Result<Request.Response, Error>) -> Void)
}

final class DefaultNetworkService: NetworkServiceProtocol {

    func request<Request: DataRequest>(_ request: Request, completion: @escaping (Result<Request.Response, Error>) -> Void) {

        guard var urlComponent = URLComponents(string: request.url) else {
            let error = NSError(
                domain: "HTTPStatusCode.notFound",
                code: 404,
                userInfo: nil
            )

            return completion(.failure(error))
        }

        var queryItems: [URLQueryItem] = []

        request.queryItems?.forEach {
            let urlQueryItem = URLQueryItem(name: $0.key, value: $0.value)
            urlComponent.queryItems?.append(urlQueryItem)
            queryItems.append(urlQueryItem)
        }

        urlComponent.queryItems = queryItems

        guard let url = urlComponent.url else {
            let error = NSError(
                domain: "HTTPStatusCode.notFound",
                code: 404,
                userInfo: nil
            )

            return completion(.failure(error))
        }

        NSLog(url.absoluteString)

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        request.headers?.forEach { urlRequest.addValue($1.rawValue,
                                                       forHTTPHeaderField: $0.rawValue)}



        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                return completion(.failure(error))
            }

            guard let response = response as? HTTPURLResponse,
                  200..<300 ~= response.statusCode else {
                return completion(.failure(NSError()))
            }

            guard let data = data else {
                return completion(.failure(NSError()))
            }

            do {
                try completion(.success(request.decode(data)))
            } catch let error as NSError {
                completion(.failure(error))
            }
        }
        .resume()
    }
}
