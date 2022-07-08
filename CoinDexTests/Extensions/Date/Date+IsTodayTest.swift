//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest

class Date_IsTodayTest: XCTestCase {
    
    func testsIsToday_01() {
        let date: Date! = Date()
        
        let isToday = date.isToday
        
        XCTAssertTrue(isToday)
    }
}
