//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

typealias FavoritableCharactersItemResponse = FavoritableModel<CharactersResponseElement>
typealias FavoritableCharactersResponse = [FavoritableCharactersItemResponse]

struct FavoritableModel<T : Codable> : Codable {
    let data: T
    var favorite: Bool = false
}
