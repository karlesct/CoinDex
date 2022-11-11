//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

class CharactersResponseConverter {
    static func convert(charactersResponse: CharactersResponse) -> [BreakingBadMasterCellModel] {
        var items: [BreakingBadMasterCellModel] = []
        
        for item in charactersResponse {
            let breakingBadMasterCellModel = BreakingBadMasterCellModel(id: item.charId,
                                                                        name: item.name,
                                                                        image: item.img)
            items.append(breakingBadMasterCellModel)
        }
        
        return items
        
        
    }
}
