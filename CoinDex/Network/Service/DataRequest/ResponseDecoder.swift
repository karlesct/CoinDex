//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

public protocol ResponseDecoder {
    associatedtype Response
    
    func decode(_ data: Data) throws -> Response
}
