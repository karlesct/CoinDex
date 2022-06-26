//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

public protocol Requestable {
    var baseURL: String { get }
    var url: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [HTTPHeaderKey : HTTPHeaderValue]? { get }
    var body: Data? { get }
    var queryItems: [String : String]? { get }

    func getURLRequest() throws -> URLRequest
}

public typealias ResponseRequestable = Requestable & ResponseDecoder
