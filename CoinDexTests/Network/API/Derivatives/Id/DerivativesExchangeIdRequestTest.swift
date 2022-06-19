//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease


class DerivativesExchangeListRequestTest: XCTestCase {

    var request: DerivativesExchangesListRequest!
    var jsonData: Data!

    override func setUp() {
        super.setUp()
        
        self.request = DerivativesExchangesListRequest(baseURL: "http://www.test.com")
        
        // The Json to decode
        self.jsonData = """
        [
          {
            "id": "binance_futures",
            "name": "Binance (Futures)"
          }
        ]
        """.data(using: .utf8)!
        
    }

    override func tearDown() {
        self.request = nil
        self.jsonData = nil
        
        super.tearDown()
        
    }
    
    func testDerivativesExchangeIdRequestTest_01() {
        XCTAssertTrue(self.request.url == "http://www.test.com/derivatives/exchanges/list")
        XCTAssertTrue(self.request.headers == [.accept: .applicationJson])
        XCTAssertTrue(self.request.method == .get)
    }
    
    func testDerivativesExchangeIdRequestTest_02() {
        do {
            let dates = try? self.request.decode(self.jsonData)
            XCTAssertNotNil(dates)
        }
    }
}
