//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

struct PingResponse: Codable {
    let geckoSays: String

    enum CodingKeys: String, CodingKey {
        case geckoSays = "gecko_says"
    }
}
