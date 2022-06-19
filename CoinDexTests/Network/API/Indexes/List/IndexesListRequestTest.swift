//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease


class IndexesListRequestTest: XCTestCase {

    var request: IndexesListRequest!
    var jsonData: Data!

    override func setUp() {
        super.setUp()
        
        self.request = IndexesListRequest(baseURL: "http://www.test.com")
        
        // The Json to decode
        self.jsonData = """
        [
          {
            "id": "DFN",
            "name": "CoinFLEX (Futures) DFN"
          }
        ]
        """.data(using: .utf8)!
        
    }

    override func tearDown() {
        self.request = nil
        self.jsonData = nil
        
        super.tearDown()
        
    }
    
    func testPingRequestTest_01() {
        XCTAssertTrue(self.request.url == "http://www.test.com/indexes/list")
        XCTAssertTrue(self.request.headers == [.accept: .applicationJson])
        XCTAssertTrue(self.request.method == .get)
    }
    
    func testPingRequestTest_02() {
        do {
            let dates = try? self.request.decode(self.jsonData)
            XCTAssertNotNil(dates)
        }
    }
}
