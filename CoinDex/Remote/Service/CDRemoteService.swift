//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

final class CDRemoteService {

    // MARK: - Properties

    private let session: URLSession

    // MARK: - Variables

    private var dataTask: URLSessionDataTask?

    // MARK: - Initializers

    init(session: URLSession) {
        self.session = session
    }

    // MARK: - Internal Methods

    func load<T>(_ type: T.Type,
                 from urlRequest: URLRequest,
                 completion completed: @escaping (Result<T, Error>) -> Void) where T: Decodable {

//        guard let url = URL(string: environmentManager.apiEndpoint()) else {
//            completed(.failure(.unexpected))
//            return
//        }

//        let urlRequest = endpoint.request(with: url, adding: [:])
//        NSLog("login url: \(urlRequest)")

        dataTask = session.dataTask(with: urlRequest,
                                    completionHandler: { data, response, error in

            if let error = error {
                completed(.failure(MDRemoteError.mapServiceError(error: error as NSError)))
            } else {

                guard let httpResponse = response as? HTTPURLResponse else {
                    completed(.failure(.internalServer))
                    return
                }

                if 200 ..< 300 ~= httpResponse.statusCode {
                    if let data = data {
                        if let result = try? JSONDecoder().decode(T.self, from: data) {
                            completed(.success(result))
                        } else {
                            completed(.failure(.mappingFailed))
                        }
                    } else {
                        completed(.failure(.noContent))
                    }

                } else {
                    guard let data = data else {
                        completed(.failure(.mappingFailed))
                        return
                    }

                    let userInfo = try? JSONSerialization.jsonObject(with: data) as? [String : Any] ?? nil
                    let error = NSError(domain: .empty, code: httpResponse.statusCode, userInfo: userInfo)
                    completed(.failure(MDRemoteError.mapServiceError(error: error)))
                }
            }
        })

        dataTask?.resume()
    }

}
