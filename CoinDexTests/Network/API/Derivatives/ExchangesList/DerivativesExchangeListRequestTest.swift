//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease


class DerivativesExchangeIdRequestTest: XCTestCase {

    var request: DerivativesExchangeIdRequest!
    var jsonData: Data!

    override func setUp() {
        super.setUp()
        
        self.request = DerivativesExchangeIdRequest(baseURL: "http://www.test.com",
                                                    id: "bitmex")
        
        // The Json to decode
        self.jsonData = """
        {
          "name": "BitMEX (Derivative)",
          "open_interest_btc": 30658.27,
          "trade_volume_24h_btc": "84503.56",
          "number_of_perpetual_pairs": 49,
          "number_of_futures_pairs": 22,
          "image": "https://assets.coingecko.com/markets/images/378/small/BitMEX.png?1591671734",
          "year_established": null,
          "country": "Seychelles",
          "description": "",
          "url": "https://www.bitmex.com/"
        }
        """.data(using: .utf8)!
        
    }

    override func tearDown() {
        self.request = nil
        self.jsonData = nil
        
        super.tearDown()
        
    }
    
    func testDerivativesExchangeIdRequestTest_01() {
        XCTAssertTrue(self.request.url == "http://www.test.com/derivatives/exchanges/bitmex")
        XCTAssertTrue(self.request.headers == [.accept: .applicationJson])
        XCTAssertTrue(self.request.method == .get)
        XCTAssertTrue(self.request.queryItems == [
            "include_tickers" : "unexpired"
        ])
    }
    
    func testDerivativesExchangeIdRequestTest_02() {
        do {
            let dates = try? self.request.decode(self.jsonData)
            XCTAssertNotNil(dates)
        }
    }
}
