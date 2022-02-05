//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

protocol SelectableItem: AnyObject, Equatable {

    var title: String { get set }
}

extension SelectableItem {

    static func == (lhs: Self, rhs: Self) -> Bool { lhs.title == rhs.title }
}
