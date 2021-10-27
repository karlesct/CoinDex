//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

struct DataItemCodable<T: Codable>: Codable {
    let data: T
}
