//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

final class Country: SelectableItem {

    var title: String

    init(title: String) {
        self.title = title
    }
}

extension Country {

    static let list: [Country] = {
        [.init(title: "Vietnam"), .init(title: "Thailand")]
    }()
}
