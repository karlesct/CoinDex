//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

typealias CategoriesListResponseArray = [CategoriesListResponse]

struct CategoriesListResponse: Codable {
    let categoryId: String
    let name: String
}
