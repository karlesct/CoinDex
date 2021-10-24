//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation


protocol NetworkService {
    func request<Request: DataRequest>(_ request: Request, completion: @escaping (Result<Request.Response, Error>) -> Void)
}

final class DefaultNetworkService: NetworkService {

    func request<Request: DataRequest>(_ request: Request, completion: @escaping (Result<Request.Response, Error>) -> Void) {

        guard let url = URL(string: request.url) else {
            let error = NSError(
                domain: "HTTPStatusCode.notFound",
                code: 404,
                userInfo: nil
            )
            completion(.failure(error))
            return
        }

        let urlRequest = request.getURLRequest(url)

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
