//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease

class Date_ColloquialTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDateColloquial_01() {
        
        var options = Date.Options()
        options.imminentRange = 5.minutes
        
        // Colloquial - Year - Future
        
        self.executeDateTest(fDate: "02-02-2018 22:00:00",
                             tDate: "02-02-2017 22:00:00",
                             options: options,
                             expected: "next year")
        self.executeDateTest(fDate: "02-02-2019 22:00:00",
                             tDate: "02-02-2017 22:00:00",
                             options: options,
                             expected: "on 2019")
        
        // Colloquial - Year - Past
        
        self.executeDateTest(fDate: "01-11-2017 00:00:00",
                             tDate: "26-11-2018 00:00:00",
                             options: options,
                             expected: "last year")
        self.executeDateTest(fDate: "01-11-2017 00:00:00",
                             tDate: "26-11-2019 00:00:00",
                             options: options,
                             expected: "2017")
        
        // Colloquial - Month - Future
        
        self.executeDateTest(fDate: "02-03-2017 22:00:00",
                             tDate: "02-02-2017 22:00:00",
                             options: options,
                             expected: "next month")
        self.executeDateTest(fDate: "02-05-2017 22:00:00",
                             tDate: "02-02-2017 22:00:00",
                             options: options,
                             expected: "in 3 months")
        
        // Colloquial - Month - Past
        
        self.executeDateTest(fDate: "02-02-2017 22:00:00",
                             tDate: "02-03-2017 22:00:00",
                             options: options,
                             expected: "1 month ago")
        self.executeDateTest(fDate: "02-02-2017 22:00:00",
                             tDate: "02-04-2017 22:54:00",
                             options: options,
                             expected: "2 months ago")
        
        // Colloquial - Week - Future
        
        self.executeDateTest(fDate: "08-02-2017 22:00:00",
                             tDate: "01-02-2017 22:00:00",
                             options: options,
                             expected: "next week")
        self.executeDateTest(fDate: "21-02-2017 22:00:00",
                             tDate: "01-02-2017 22:00:00",
                             options: options,
                             expected: "in 3 weeks")
        
        // Colloquial - Week - Past
        
        self.executeDateTest(fDate: "01-02-2017 22:00:00",
                             tDate: "08-02-2017 22:00:00",
                             options: options,
                             expected: "1 week ago")
        self.executeDateTest(fDate: "01-02-2017 22:00:00",
                             tDate: "25-02-2017 22:00:00",
                             options: options,
                             expected: "3 weeks ago")
        
        // Colloquial - Day - Future
        
        self.executeDateTest(fDate: "02-01-2017 22:00:00",
                             tDate: "01-01-2017 22:00:00",
                             options: options,
                             expected: "tomorrow")
        self.executeDateTest(fDate: "05-01-2017 22:00:00",
                             tDate: "01-01-2017 22:00:00",
                             options: options,
                             expected: "in 4 days")
        
        // Colloquial - Day - Past
        
        self.executeDateTest(fDate: "01-01-2017 22:00:00",
                             tDate: "02-01-2017 22:00:00",
                             options: options,
                             expected: "yesterday")
        self.executeDateTest(fDate: "01-01-2017 22:00:00",
                             tDate: "05-01-2017 22:00:00",
                             options: options,
                             expected: "4 days ago")
        self.executeDateTest(fDate: "03-02-2017 07:00:00",
                             tDate: "02-02-2017 04:00:00",
                             options: options,
                             expected: "tomorrow")
        
        // Colloquial - Hour - Future
        
        self.executeDateTest(fDate: "02-02-2017 02:00:00",
                             tDate: "02-02-2017 01:00:00",
                             options: options,
                             expected: "in 1 hour")
        self.executeDateTest(fDate: "02-02-2017 04:00:00",
                             tDate: "02-02-2017 01:00:00",
                             options: options,
                             expected: "in 3 hours")
        self.executeDateTest(fDate: "02-02-2017 04:00:00",
                             tDate: "03-02-2017 07:00:00",
                             options: options,
                             expected: "yesterday")
        
        // Colloquial - Hour - Past
        
        self.executeDateTest(fDate: "02-02-2017 01:00:00",
                             tDate: "02-02-2017 02:00:00",
                             options: options,
                             expected: "1 hour ago")
        self.executeDateTest(fDate: "02-02-2017 01:00:00",
                             tDate: "02-02-2017 04:00:00",
                             options: options,
                             expected: "3 hours ago")
        
        // Colloquial - Minute - Future
        
        options.imminentRange = nil
        self.executeDateTest(fDate: "02-02-2017 22:01:00",
                             tDate: "02-02-2017 22:00:00",
                             options: options,
                             expected: "in 1 minute")
        self.executeDateTest(fDate: "02-02-2017 22:59:00",
                             tDate: "02-02-2017 22:00:00",
                             options: options,
                             expected: "in 59 minutes")
        
        // Colloquial - Minute - Past
        
        self.executeDateTest(fDate: "02-02-2017 22:00:00",
                             tDate: "02-02-2017 22:01:00",
                             options: options,
                             expected: "1 minute ago")
        self.executeDateTest(fDate: "02-02-2017 22:00:00",
                             tDate: "02-02-2017 22:59:00",
                             options: options,
                             expected: "59 minutes ago")
        
        // Colloquial - Now
        
        options.imminentRange = 5.minutes
        self.executeDateTest(fDate: "02-02-2017 22:00:00",
                             tDate: "02-02-2017 22:00:00",
                             options: options,
                             expected: "just now")
        self.executeDateTest(fDate: "02-02-2017 22:00:00",
                             tDate: "02-02-2017 22:00:05",
                             options: options,
                             expected: "just now")
        self.executeDateTest(fDate: "02-02-2017 22:00:00",
                             tDate: "02-02-2017 22:04:59",
                             options: options,
                             expected: "just now")



    }
    
    func executeDateTest(fDate: String,
                         tDate: String,
                         options: Date.Options,
                         expected: String) {
        let format = "dd-MM-yyyy HH:mm:ss"
        let fromDate = self.date(format: format, date: fDate)!
        let toDate = self.date(format: format, date: tDate)!
        let colloquial = fromDate.colloquial(to: toDate,
                                             options: options)
        XCTAssert(colloquial == expected, "Failed to get colloquial for dates: \(fromDate) - \(toDate). Got '\(colloquial)', expected '\(expected)'")
    }
    
    
    func date(format: String, date: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        let result = dateFormatter.date(from: date)
        return result
    }
}
