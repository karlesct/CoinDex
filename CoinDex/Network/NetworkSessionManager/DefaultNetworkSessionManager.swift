//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

public class DefaultNetworkSessionManager: NetworkSessionManager {
    public func request(_ request: URLRequest,
                        completion: @escaping CompletionHandler) -> NetworkCancellable {
        let task = URLSession.shared.dataTask(with: request,
                                              completionHandler: completion)
        task.resume()
        return task
    }
}
