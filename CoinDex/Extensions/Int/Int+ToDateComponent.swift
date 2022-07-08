//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

public extension Int {
    
    /// Internal transformation function
    ///
    /// - parameter type: component to use
    ///
    /// - returns: return self value in form of `DateComponents` where given `Calendar.Component` has `self` as value
    internal func toDateComponents(type: Calendar.Component) -> DateComponents {
        var dateComponents = DateComponents()
        dateComponents.setValue(self, for: type)
        return dateComponents
    }

    /// Create a `DateComponents` with `self` value set as nanoseconds
    var nanoseconds: DateComponents {
        return self.toDateComponents(type: .nanosecond)
    }
    
    /// Create a `DateComponents` with `self` value set as seconds
    var seconds: DateComponents {
        return self.toDateComponents(type: .second)
    }
    
    /// Create a `DateComponents` with `self` value set as minutes
    var minutes: DateComponents {
        return self.toDateComponents(type: .minute)
    }
    
    /// Create a `DateComponents` with `self` value set as hours
    var hours: DateComponents {
        return self.toDateComponents(type: .hour)
    }
    
    /// Create a `DateComponents` with `self` value set as days
    var days: DateComponents {
        return self.toDateComponents(type: .day)
    }
    
    /// Create a `DateComponents` with `self` value set as weeks
    var weeks: DateComponents {
        return self.toDateComponents(type: .weekOfYear)
    }
    
    /// Create a `DateComponents` with `self` value set as months
    var months: DateComponents {
        return self.toDateComponents(type: .month)
    }
    
    /// Create a `DateComponents` with `self` value set as years
    var years: DateComponents {
        return self.toDateComponents(type: .year)
    }
}
