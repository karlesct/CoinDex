//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

public extension Date {
    
    var isYesterday: Bool {
        return Calendar.current.isDateInYesterday(self)
    }
}
