//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease


class IndexesRequestTest: XCTestCase {

    var request: IndexesRequest!
    var jsonData: Data!

    override func setUp() {
        super.setUp()
        
        self.request = IndexesRequest(baseURL: "http://www.test.com",
                                      perPage: 10,
                                      page: 1)
        
        // The Json to decode
        self.jsonData = """
        [
          {
            "name": "CoinFLEX (Futures) DFN",
            "id": "DFN",
            "market": "CoinFLEX (Futures)",
            "last": null,
            "is_multi_asset_composite": null
          }
        ]
        """.data(using: .utf8)!
        
    }

    override func tearDown() {
        self.request = nil
        self.jsonData = nil
        
        super.tearDown()
        
    }
    
    func testIndexesRequestTest_01() {
        XCTAssertTrue(self.request.url == "http://www.test.com/indexes")
        XCTAssertTrue(self.request.headers == [.accept: .applicationJson])
        XCTAssertTrue(self.request.method == .get)
        XCTAssertTrue(self.request.queryItems == [
            "per_page" : "10",
            "page" : "1"
        ])
    }
    
    func testIndexesRequestTest_02() {
        do {
            let dates = try? self.request.decode(self.jsonData)
            XCTAssertNotNil(dates)
        }
    }
}
