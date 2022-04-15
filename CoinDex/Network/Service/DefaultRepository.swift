//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

protocol DefaultRepositoryProtocol {
    func fetch<T: DataRequest>(request: T, completion: @escaping (Result<T.Response, Error>) -> Void)
}

final class DefaultRepository {

    // MARK: - Properties

    // MARK: - Init

    init() {}

}
extension DefaultRepository: DefaultRepositoryProtocol {

    func fetch<T: DataRequest>(request: T, completion: @escaping (Result<T.Response, Error>) -> Void) {
        return DefaultNetworkService().request(request, completion: completion)
    }
}
