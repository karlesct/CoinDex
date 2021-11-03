//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

typealias ExchangesListResponse = [ExchangesListResponseElement]

struct ExchangesListResponseElement: Codable {
    let id: String
    let name: String
}
