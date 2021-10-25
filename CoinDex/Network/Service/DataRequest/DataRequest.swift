//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

protocol DataRequest {
    associatedtype Response

    var baseURL: String { get }
    var url: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [HTTPHeaderKey : HTTPHeaderValue]? { get }
    var body: Data? { get }
    var queryItems: [String : String]? { get }

    func decode(_ data: Data) throws -> Response
    func getURLRequest(_ baseURL: URL) -> URLRequest
}
