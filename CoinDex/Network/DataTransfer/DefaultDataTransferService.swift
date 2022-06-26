//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

public final class DefaultDataTransferService {
    
    private let networkService: NetworkService
    
    public init(networkService: NetworkService) {
        self.networkService = networkService
    }
}

extension DefaultDataTransferService: DataTransferService {
    
    public func request<T: Codable,
                        E: ResponseRequestable>(endpoint: E,
                                                completion: @escaping CompletionHandler<T>) -> NetworkCancellable? where E.Response == T {
        
        return self.networkService.request(endpoint: endpoint) { result in
            switch result {
            case let .success(data):
                do {
                    guard let data = data else {
                        return completion(.failure(NSError()))
                    }
                    
                    let result = try endpoint.decode(data)
                    DispatchQueue.main.async { return completion(.success(result)) }
                } catch {
                    DispatchQueue.main.async { return completion(.failure(error)) }
                }
                
                
            case let .failure(error):
                DispatchQueue.main.async { return completion(.failure(error)) }
            }
        }
    }
    
    public func request<E: ResponseRequestable>(endpoint: E,
                                                completion: @escaping CompletionHandler<Void>) -> NetworkCancellable? where E.Response == Void{
        return self.networkService.request(endpoint: endpoint) { result in
            switch result {
            case .success:
                DispatchQueue.main.async { return completion(.success(())) }
            case let .failure(error):
                DispatchQueue.main.async { return completion(.failure(error)) }
            }
        }
    }
}
