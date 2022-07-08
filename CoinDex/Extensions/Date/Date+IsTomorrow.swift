//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

public extension Date {
    
    var isTomorrow: Bool {
        return Calendar.current.isDateInTomorrow(self)
    }
}
