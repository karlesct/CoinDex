//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

extension String {
    func getFlag() -> String {
        unicodeScalars
            .map { 127_397 + $0.value }
            .compactMap(UnicodeScalar.init)
            .map(String.init)
            .joined()
    }
}
