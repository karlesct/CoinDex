//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

class ExchangeResponseConverter {
    static func convert(exchangeResponse: ExchangesResponse) -> [ExchangesListMasterCellModel] {
        var items: [ExchangesListMasterCellModel] = []
        
        for item in exchangeResponse {
            let coinListMasterCell = ExchangesListMasterCellModel(id: item.id,
                                                             name: item.name,
                                                             image: item.image)
            items.append(coinListMasterCell)
        }
        
        return items
        
        
    }
}
