//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

typealias AssetPlatformsResponseArray = [AssetPlatformsResponse]

struct AssetPlatformsResponse: Codable {
    let id: String?
    let chainIdentifier: Int?
    let name: String
    let shortname: String
}
