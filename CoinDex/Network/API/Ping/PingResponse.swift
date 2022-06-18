//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

protocol PingResponseType {
    var geckoSays: String { get }
}

struct PingResponse: Codable, PingResponseType {
    let geckoSays: String
}
