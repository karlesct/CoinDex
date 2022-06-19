//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease

class ExchangesRequestListTest: XCTestCase {

    var request: ExchangesListRequest!
    var jsonData: Data!

    override func setUp() {
        super.setUp()
        
        self.request = ExchangesListRequest(baseURL: "http://www.test.com")
        
        // The Json to decode
        self.jsonData = """
        [
          {
            "id": "1bch",
            "name": "1BCH"
          }
        ]
        """.data(using: .utf8)!
        
    }

    override func tearDown() {
        self.request = nil
        self.jsonData = nil
        
        super.tearDown()
        
    }
    
    func testExchangesRequestListTest_01() {
        XCTAssertTrue(self.request.url == "http://www.test.com/exchanges/list")
        XCTAssertTrue(self.request.headers == [.accept: .applicationJson])
        XCTAssertTrue(self.request.method == .get)
    }
    
    func testExchangesRequestListTest_02() {
        do {
            let dates = try? self.request.decode(self.jsonData)
            XCTAssertNotNil(dates)
        }
    }
}
