//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

public protocol NetworkCancellable {
    func cancel()
}

extension URLSessionTask: NetworkCancellable { }
