//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease


class CoinsListRequestTest: XCTestCase {

    var request: CoinsListRequest!
    var jsonData: Data!

    override func setUp() {
        super.setUp()
        
        self.request = CoinsListRequest(baseURL: "http://www.test.com")
        
        // The Json to decode
        self.jsonData = """
        [
            {
              "id": "newscrypto-coin",
              "symbol": "nwc",
              "name": "Newscrypto Coin",
              "platforms": {
                    "xdai": "test",
                    "ethereum": "test",
                }
            }
        ]
        """.data(using: .utf8)!
        
    }

    override func tearDown() {
        self.request = nil
        self.jsonData = nil
        
        super.tearDown()
        
    }
    
    func testCoinsListRequestTest_01() {
        XCTAssertTrue(self.request.url == "http://www.test.com/coins/list")
        XCTAssertTrue(self.request.headers == [.accept: .applicationJson])
        XCTAssertTrue(self.request.method == .get)
        XCTAssertTrue(self.request.queryItems == [
            "include_platform" : "true"          // bitcoin or ethereum
        ])
    }
    
    func testCoinsListRequestTest_02() {
        do {
            let dates = try? self.request.decode(self.jsonData)
            XCTAssertNotNil(dates)
        }
    }
}
