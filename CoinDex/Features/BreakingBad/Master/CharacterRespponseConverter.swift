//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

class CharacterRespponseConverter {
    static func convert(characterResponse: CharactersResponse) -> FavoritableCharactersResponse {
        var items: FavoritableCharactersResponse = []
        
        for item in characterResponse {
            let itemResponse: FavoritableCharactersItemResponse = .init(data: item)
            items.append(itemResponse)
        }
        
        return items
        
        
    }
}
