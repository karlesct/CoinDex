//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

typealias DerivativesExchangesListResponse = [DerivativesExchangesListResponseElement]

struct DerivativesExchangesListResponseElement: Codable {
    let id: String
    let name: String
}
