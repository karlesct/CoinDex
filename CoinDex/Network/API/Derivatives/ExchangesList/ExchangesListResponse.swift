//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

typealias ExchangesListResponseArray = [ExchangesListResponse]

struct ExchangesListResponse: Codable {
    let id: String
    let name: String
}
