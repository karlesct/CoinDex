//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation
import UIKit

struct  CountryPickerCellModel: TModel {

    // MARK: - Properties

    private var item: CountryModel

    var flag: String {
        return item.isoCode.getFlag()
    }

    var flagImage: UIImage? {
        return UIImage(named: item.isoCode)
    }

    var countryName: String {
        return item.localizedName
    }

    var phoneCode: String {
        return item.phoneCode
    }

    // MARK: - Init

    init(item: CountryModel) {
        self.item = item
    }
}

extension CountryPickerCellModel: Filterable {
    var value: String {
        return item.localizedName
    }
}
