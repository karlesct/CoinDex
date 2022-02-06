//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

struct ToggleInputCellModel {

    var title: String
    var value: Bool

    init(title: String, value: Bool = false) {
        self.title = title
        self.value = value
    }
}
