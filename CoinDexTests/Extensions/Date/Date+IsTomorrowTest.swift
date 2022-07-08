//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest

class Date_IsTomorrowTest: XCTestCase {
    
    func testsIsToday_01() {
        let date: Date! = Calendar.current.date(byAdding: .day,
                                                value: 1,
                                                to: Date())
        let isTomorrow = date.isTomorrow
        
        XCTAssertTrue(isTomorrow)
    }
}
