//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

public enum DataTransferError: Error {
    case noResponse
    case parsing(Error)
}

public protocol DataTransferService {
    typealias CompletionHandler<T> = (Result<T, Error>) -> Void
    
    @discardableResult
    func request<T: Codable,
                 E: ResponseRequestable>(endpoint: E,
                                         completion: @escaping CompletionHandler<T>) -> NetworkCancellable? where E.Response == T
    @discardableResult
    func request<E: ResponseRequestable>(endpoint: E,
                                         completion: @escaping CompletionHandler<Void>) -> NetworkCancellable? where E.Response == Void
}
