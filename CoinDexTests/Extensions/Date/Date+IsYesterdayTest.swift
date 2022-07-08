//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest

class Date_IsYesterdayTest: XCTestCase {
    
    func testsIsToday_01() {
        let date: Date! = Calendar.current.date(byAdding: .day,
                                                value: -1,
                                                to: Date())
        let isYesterday = date.isYesterday
        
        XCTAssertTrue(isYesterday)
    }
}
