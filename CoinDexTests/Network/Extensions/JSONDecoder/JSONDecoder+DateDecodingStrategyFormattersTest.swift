//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease

// Data structure
struct MockDates: Codable {
    var date1: Date
    var date2: Date
    var date3: Date
    var date4: Date
    var date5: Date
}

class JSONDecoder_DateDecodingStrategyFormattersTest: XCTestCase {

    var jsonData: Data!

    override func setUp() {
        super.setUp()
        
        // The Json to decode
        self.jsonData = """
        {
            "date1": "2019-05-30 15:18:00",
            "date2": "2019-05-30T05:18:00",
            "date3": "2019-04-17",
            "date4": "2017-07-01T14:59:55.711Z",
            "date5": "2017-10-14T22:11:20+0",
        }
        """.data(using: .utf8)!
        
    }

    override func tearDown() {
        self.jsonData = nil
        
        super.tearDown()
        
    }
    
    func testJSONDecoder_DateDecodingStrategyFormatters_01() {
        
        let decoder = JSONDecoder()
        decoder.setDateDecodingStrategyFormatters([
            DateFormatter.yyyyMMddHHmmss,
            DateFormatter.yyyyMMddTHHmmss,
            DateFormatter.yyyyMMdd,
            DateFormatter.yyyyMMddTHHmmssSSSZ,
            DateFormatter.yyyyMMddTHHmmssZ
        ])
        
        do {
            let dates = try? decoder.decode(MockDates.self, from: jsonData)
            XCTAssertTrue(dates?.date1 is Date)
            XCTAssertTrue(dates?.date2 is Date)
            XCTAssertTrue(dates?.date3 is Date)
            XCTAssertTrue(dates?.date4 is Date)
            XCTAssertTrue(dates?.date5 is Date)
        }
    }
    
    func testJSONDecoder_DateDecodingStrategyFormatters_02() {
        
        let decoder = JSONDecoder()
        decoder.setDateDecodingStrategyFormatters(nil)
        
        do {
            let dates = try? decoder.decode(MockDates.self, from: jsonData)
            XCTAssertNil(dates)
        }
    }
    
    func testJSONDecoder_DateDecodingStrategyFormatters_03() {
        
        // Assigning mutliple DateFormatters
        let decoder = JSONDecoder()
        decoder.setDateDecodingStrategyFormatters([
            DateFormatter.yyyyMMddTHHmmssSSSZZZZ
        ])
        
        do {
            let dates = try? decoder.decode(MockDates.self, from: jsonData)
            XCTAssertNil(dates)
        }
    }
}
