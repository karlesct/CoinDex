//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest

class Date_IsInPastTest: XCTestCase {
    
    func testsIsInPast_01() {
        let date: Date! = Calendar.current.date(byAdding: .day,
                                                value: -10,
                                                to: Date())
        
        let isInPast = date.isInPast
        
        XCTAssertTrue(isInPast)
    }
}
