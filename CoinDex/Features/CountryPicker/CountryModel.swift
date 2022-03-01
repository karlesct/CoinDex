//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

public struct CountryModel: Codable {
    let phoneCode: String
    let isoCode: String

    init(phoneCode: String,
         isoCode: String) {
        self.phoneCode = phoneCode
        self.isoCode = isoCode
    }
}

public extension CountryModel {
    var localizedName: String {
        let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: isoCode])
        let name = NSLocale(localeIdentifier: NSLocale.current.identifier)
            .displayName(forKey: NSLocale.Key.identifier, value: id) ?? isoCode
        return name
    }
}
