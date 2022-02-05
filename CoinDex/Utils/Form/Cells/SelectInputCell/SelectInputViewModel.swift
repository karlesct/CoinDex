//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

struct SelectInputViewModel {

    var title: String
    var value: String?

    init(title: String, value: String? = nil) {
        self.title = title
        self.value = value
    }
}
