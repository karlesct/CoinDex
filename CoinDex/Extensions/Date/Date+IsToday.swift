//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

public extension Date {
    
    var isToday: Bool {
        return Calendar.current.isDateInToday(self)
    }
}
