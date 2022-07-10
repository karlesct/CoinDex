// Copyright © 2022 MeetingDoctors S.L. All rights reserved.

import Foundation

public extension Date {
    
    struct Options {
        
        /// Define the list of allowed components used to format a date diff.
        /// If you want exclude one or more time unit (ie. you are not interested in printing the weeks
        /// but you want to get only the days) you can set a different set of components (ie. [.day]).
        /// By default all components are allowed (`[.year, .month, .weekOfYear, .day, .hour, .minute, .second]`).
        public var allowedComponents: Set<Calendar.Component> = [
            .year,
            .month,
            .weekOfYear,
            .day,
            .hour,
            .minute,
            .second
        ]
        
        /// Define the maximum amount of time used to fallback a dates difference to "just now" fallback.
        /// You need to express it in `DateComponents`, so if you want a "just now" result when difference
        /// is less than one hour and 5 minutes you need to set it to `1.hour + 5.minutes`.
        /// By default this value is set to `5.minutes`, so when difference is below five minutes the colloquial
        /// result return `just now` in set locale.
        public var imminentRange: DateComponents? = 5.minutes
        
        /// Define the minimum amount of time used to fallback a colloquial string to an absolute version of the data;
        /// for example if you set it to `2.months` when date diff is longer than 2 months you will get an absolute value
        /// (ie. `dd/MM` instead of `in 3 months`).
        /// By default this value is set to `nil` so fallback never occurs.
        /// The following table defines the absolute representation of date diff for each unit (in locale's format):
        /// * `seconds`: not applicable
        /// * `minute`: not applicable
        /// * `hour`: 'HH:mm'
        /// * `day`: 'dd/MM'
        /// * `month`: `MM/yyyy'
        /// * `year`: 'yyyy`
        public var distantRange: DateComponents? = nil
    }
    
    /// Helper function
    private static let daysInWeek = 7
    
    func colloquialSinceNow(options fOptions: Date.Options? = nil) -> String {
        return self.colloquial(to: Date(), options: fOptions)
    }

    func colloquial(to date: Date,
                    options fOptions: Date.Options? = nil) -> String {
        return Date.colloquial(from: self, to: date, options: fOptions)
    }

    // swiftlint:disable function_body_length
    static func colloquial(from fDate: Date,
                           to tDate: Date,
                           options fOptions: Date.Options? = nil) -> String {

        let options = fOptions ?? Date.Options()
        
        func value(for component: Calendar.Component, in cmps: DateComponents) -> Int? {
            guard options.allowedComponents.contains(component) else { return nil } // time unit is not allowed by options
            
            guard let value = cmps.value(for: component), value != 0 else { return nil } // time unit has not a value
            return value // time unit has a valid difference value
        }
        
        func imminentString() -> String {
            return "colloquial_now".localized
        }
        
        func isImminentValue(for component: Calendar.Component, value: Int) -> Bool {
            guard let imminent = options.imminentRange?.in(.second) else { return false } // imminent range is not set
            switch component { // imminent range is valid for minute and hour units, otherwise it return false
            case .minute:   return (TimeInterval(value * 60) < TimeInterval(imminent))
            case .hour:     return (TimeInterval(value * 60 * 60) < TimeInterval(imminent))
            default:        return false
            }
        }
        
        func colloquialString(for component: Calendar.Component, value: Int, future: Bool, args: CVarArg...) -> String {
            let component_key = component.localizedKey(forValue: value)
            let identifier = "colloquial_\(future ? "f" : "p")_\(component_key)"
            
            let localized_date = withVaList(args) { (pointer: CVaListPointer) -> String in
                let localized = identifier.localized
                return NSString(format: localized, arguments: pointer) as String
            }
            return localized_date
        }

        func dateComponents(_ date: Date) -> DateComponents {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .weekOfMonth], from: date)
            return components
        }
        // swiftlint:disable cyclomatic_complexity function_body_length
        func differenceBetween(from fComponent: DateComponents,
                               to tComponent: DateComponents) -> String? {
            
            // Differences between two dates is zero
            guard fDate.timeIntervalSince1970 != tDate.timeIntervalSince1970 else {
                return imminentString()
            }
            
            var allowedComponents = options.allowedComponents
            allowedComponents.remove(.weekOfYear)
            let cal = Calendar.current
            let cmps = cal.dateComponents(allowedComponents,
                                          from: fDate,
                                          to: tDate)
            let isFuture = (fDate > tDate)
            
            // Years difference
            if let years = value(for: .year, in: cmps) {
                let value = (years == 1 || years == -1 ? years : fDate.year)
                return colloquialString(for: .year, value: value, future: isFuture, args: abs(value))
            }
            
            // Months difference
            if let months = value(for: .month, in: cmps) {
//                if isDistant { return distant(for: .month, in: tDate) }
                return colloquialString(for: .month, value: months, future: isFuture, args: abs(months))
            }
            
            // Days difference
            if let days = value(for: .day, in: cmps) {
//                if isDistant { return distant(for: .day, in: tDate) }
                let isWeekAllowed = options.allowedComponents.contains(.weekOfYear)
                if abs(days) < Date.daysInWeek  || !isWeekAllowed { // Less than a week or week representation is not accepted
                    return colloquialString(for: .day, value: days, future: isFuture, args: abs(days))
                } else { // More than a week
                    if isWeekAllowed { // Weeks representation is allowed
                        let weeks = Int(floor(Double(days) / Double(Date.daysInWeek)))
                        return colloquialString(for: .weekOfYear, value: weeks, future: isFuture, args: abs(weeks))
                    }
                }
            }
            
            // Hours difference
            if let hours = value(for: .hour, in: cmps) {
//                if isDistant { return distant(for: .hour, in: tDate) }
                let isDifferentDay = (cal.isDate(fDate, inSameDayAs: tDate) == false)
                if isDifferentDay { // cross day comparison, return yesterday or tomorrow
                    return isFuture ? "colloquial_f_d".localized : "colloquial_p_d".localized
                } else {
                    if isImminentValue(for: .hour, value: abs(hours)) { // is imminent
                        return imminentString()
                    }
                    // standard hours difference
                    return colloquialString(for: .hour, value: hours, future: isFuture, args: abs(hours))
                }
            }
            
            // Minutes difference
            if let minutes = value(for: .minute, in: cmps) {
                if isImminentValue(for: .minute, value: abs(minutes)) { // is imminent
                    return imminentString()
                }
                // standard minutes difference
                return colloquialString(for: .minute, value: minutes, future: isFuture, args: abs(minutes))
            }
            
            // Seconds difference fall to imminent
            if let _ = value(for: .second, in: cmps) {
                return imminentString()
            }
            
            // Failed to parse
            return nil
        }

        let difference = differenceBetween(from: dateComponents(fDate), to: dateComponents(tDate))

        return difference ?? .empty
    }

    // MARK: Components:

    var year: Int {
        return Calendar.current.component(.year, from: self)
    }

    var month: Int {
        return Calendar.current.component(.month, from: self)
    }

    var day: Int {
        return Calendar.current.component(.day, from: self)
    }

    /// Returns the difference in the calendar component given (like day, month or year)
    /// with respect to the other date as a positive integer
    func difference(in component: Calendar.Component, from other: Date) -> Int? {
        let (max, min) = orderDate(with: other)
        let result = Calendar.current.dateComponents([component], from: min, to: max)
        return self.getValue(of: component, from: result)
    }

    private func getValue(of component: Calendar.Component, from dateComponents: DateComponents) -> Int? {
        switch component {
        case .era:
            return dateComponents.era
        case .year:
            return dateComponents.year
        case .month:
            return dateComponents.month
        case .day:
            return dateComponents.day
        case .hour:
            return dateComponents.hour
        case .minute:
            return dateComponents.minute
        case .second:
            return dateComponents.second
        case .weekday:
            return dateComponents.weekday
        case .weekdayOrdinal:
            return dateComponents.weekdayOrdinal
        case .quarter:
            return dateComponents.quarter
        case .weekOfMonth:
            return dateComponents.weekOfMonth
        case .weekOfYear:
            return dateComponents.weekOfYear
        case .yearForWeekOfYear:
            return dateComponents.yearForWeekOfYear
        case .nanosecond:
            return dateComponents.nanosecond
        case .calendar, .timeZone:
            return nil
            @unknown default:
            assert(false, "unknown date component")
        }
        return nil
    }

    private func orderDate(with other: Date) -> (Date, Date) {
        let first = self.timeIntervalSince1970
        let second = other.timeIntervalSince1970

        if first >= second {
            return (self, other)
        }

        return (other, self)
    }
    
    func add(components: DateComponents) -> Date? {
        let date = Calendar.current.date(byAdding: components,
                                         to: self)
        return date
    }
}

extension DateComponents {
    public func `in`(_ component: Calendar.Component) -> Int? {
        let dateFrom = Date()
        let dateTo = dateFrom.add(components: self) ?? Date()
        let components: Set<Calendar.Component> = [component]
        let value = Calendar.current.dateComponents(components,
                                                    from: dateFrom,
                                                    to: dateTo)
            .value(for: component)
        return value
    }
}


internal extension Calendar.Component {
    
    /// Return the localized identifier of a calendar component
    ///
    /// - parameter unit:  unit
    /// - parameter value: value
    ///
    /// - returns: return the plural or singular form of the time unit used to compose a valid identifier for search a localized
    ///   string in resource bundle
    func localizedKey(forValue value: Int) -> String {
        let locKey = self.localizedKey
        let absValue = abs(value)
        switch absValue {
        case 0: // zero difference for this unit
            return "0\(locKey)"
        case 1: // one unit of difference
            return locKey
        default: // more than 1 unit of difference
            return "\(locKey)\(locKey)"
        }
    }
    
    
    var localizedKey: String {
        switch self {
        case .year:
            return "y"
        case .month:
            return "m"
        case .weekOfYear:
            return "w"
        case .day:
            return "d"
        case .hour:
            return "h"
        case .minute:
            return "M"
        case .second:
            return "s"
        default:
            return .empty
        }
    }
    
}
