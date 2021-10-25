//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

struct DataCodable<T: Codable>: Codable {
    let data: T
}
