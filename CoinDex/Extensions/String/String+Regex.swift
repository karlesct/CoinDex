//
//  Copyright © 2022 CCT. All rights reserved.
//

import Foundation

extension String {

    enum RegexPattern: String {
        case room = "[a-z\\d]{8}-[a-z\\d]{4}-[a-z\\d]{4}-[a-z\\d]{4}-[a-z\\d]{12}"
        // more than two characters or numbers equal: aaa, bbb.. 111, 222..
        case repeatedCharacters = "(\\w)\\1{2,}"
        // more than two consecutive numbers
        case serialNumbers = "(012|123|234|345|456|567|678|789)+"
        // more than two consecutive characters
        case serialCharacters = "(abc|bcd|cde|def|efg|fgh|ghi|hij|ijk|jkl|klm|lmn|mno|nop|opq|pqr|qrs|rst|stu|tuv|uvw|vwx|wxy|xyz)+"
        // contains special characters
        case specialCharacters = "[!@#$%^&*(),.?\":{}|<>]"
        // contains numbers
        case containNumbers = "[0-9]"
        // contains lowercase and uppercase
        case hasLowerAndUpper = "[a-z].*[A-Z]|[A-Z].*[a-z]"
    }

    // Match or not match
    func match(regex: RegexPattern) -> Bool {

        return self.range(of: regex.rawValue,
                          options: .regularExpression,
                          range: nil,
                          locale: nil) != nil
    }

}
