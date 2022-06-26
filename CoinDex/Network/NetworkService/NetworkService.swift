//
//  Copyright © 2021 CCT. All rights reserved.
//


import UIKit

public protocol NetworkService {
    typealias CompletionHandler = (Result<Data?, Error>) -> Void
    
    func request(endpoint: Requestable, completion: @escaping CompletionHandler) -> NetworkCancellable?
}
