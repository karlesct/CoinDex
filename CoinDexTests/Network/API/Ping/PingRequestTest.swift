//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease


class PingRequestTest: XCTestCase {

    var request: PingRequest!
    var jsonData: Data!

    override func setUp() {
        super.setUp()
        
        self.request = PingRequest(baseURL: "http://www.test.com")
        
        // The Json to decode
        self.jsonData = """
        {
          "gecko_says": "(V3) To the Moon!"
        }
        """.data(using: .utf8)!
        
    }

    override func tearDown() {
        self.request = nil
        self.jsonData = nil
        
        super.tearDown()
        
    }
    
    func testPingRequestTest_01() {
        XCTAssertTrue(self.request.url == "http://www.test.com/ping")
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
