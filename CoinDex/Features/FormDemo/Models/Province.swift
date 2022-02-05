//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

final class Province: SelectableItem {

    var title: String

    init(title: String) {
        self.title = title
    }
}

extension Province {

    static let vietProvinces: [Province] = {
        [.init(title: "Hanoi"), .init(title: "Hanoi 1")]
    }()

    static let thaiProvinces: [Province] = {
        [.init(title: "Bangkok"), .init(title: "Bangkok 1")]
    }()
}
