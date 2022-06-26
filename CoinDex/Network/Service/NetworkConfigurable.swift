//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

protocol NetworkConfigurable {
    var baseURL: URL { get }
    var headers: [String: String] { get }
    var queryParameters: [String: String] { get }
}

struct ApiDataNetworkConfig: NetworkConfigurable {
    var baseURL: URL
    var headers: [String : String]
    var queryParameters: [String : String]
}
