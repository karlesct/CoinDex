//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

struct DataArrayCodable<T: Codable>: Codable {
    let data: [T]
}
