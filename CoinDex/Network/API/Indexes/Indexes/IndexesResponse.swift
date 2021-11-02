//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

typealias IndexesResponseArray = [IndexesResponse]

struct IndexesResponse: Codable {
    let name: String
    let id: String
    let market: String
    let last: Double?
    let isMultiAssetComposite: Bool?
}
