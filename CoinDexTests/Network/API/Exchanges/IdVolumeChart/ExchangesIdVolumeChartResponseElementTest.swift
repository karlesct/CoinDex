//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease

class ExchangesIdVolumeChartResponseElementTest: XCTestCase {
    
    var jsonData: Data!

    override func setUp() {
        super.setUp()
        
        // The Json to decode
        self.jsonData = """
        {
            "date": "2019-05-30 15:18:00",
            "value": "test"
        }
        """.data(using: .utf8)!
        
    }
    
    override func tearDown() {
        self.jsonData = nil
        
        super.tearDown()
        
    }
    
    func testExchangesIdVolumeChartResponseElementTest_02() {
        
        let decoder = JSONDecoder()
        decoder.setDateDecodingStrategyFormatters([
            DateFormatter.yyyyMMddHHmmss
        ])
        
        do {
            let dates = try? decoder.decode(ExchangesIdVolumeChartResponseElement.self, from: jsonData)
            XCTAssertNil(dates)
        }
    }

}
