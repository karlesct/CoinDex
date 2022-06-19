//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease


class ExchangesIdVolumeChartRequestTest: XCTestCase {

    var request: ExchangesIdVolumeChartRequest!
    var jsonData: Data!

    override func setUp() {
        super.setUp()
        
        self.request = ExchangesIdVolumeChartRequest(baseURL: "http://www.test.com")
        
        // The Json to decode
        self.jsonData = """
        [
          [
            1655572200000,
            "603321.5266676439438454"
          ]
        ]
        """.data(using: .utf8)!
        
    }

    override func tearDown() {
        self.request = nil
        self.jsonData = nil
        
        super.tearDown()
        
    }
    
    func testExchangesIdVolumeChartRequestTest_01() {
        XCTAssertTrue(self.request.url == "http://www.test.com/exchanges/binance/volume_chart")
        XCTAssertTrue(self.request.headers == [.accept: .applicationJson])
        XCTAssertTrue(self.request.method == .get)
        XCTAssertTrue(self.request.queryItems == [
            "days" : "15"
        ])
    }
    
    func testExchangesIdVolumeChartRequestTest_02() {
        do {
            let dates = try? self.request.decode(self.jsonData)
            XCTAssertNotNil(dates)
        }
    }
}
