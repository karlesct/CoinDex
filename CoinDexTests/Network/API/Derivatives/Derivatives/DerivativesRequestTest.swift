//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease


class DerivativesRequestTest: XCTestCase {

    var request: DerivativesRequest!
    var jsonData: Data!

    override func setUp() {
        super.setUp()
        
        self.request = DerivativesRequest(baseURL: "http://www.test.com")
        
        // The Json to decode
        self.jsonData = """
        [
          {
            "market": "Binance (Futures)",
            "symbol": "BTCUSDT",
            "index_id": "BTC",
            "price": "18630.91",
            "price_percentage_change_24h": -9.89442647436799,
            "contract_type": "perpetual",
            "index": 18578.59912658,
            "basis": -0.00969232858280769,
            "spread": 0.01,
            "funding_rate": 0.008351,
            "open_interest": 1787688728.58,
            "volume_24h": 15776116837.200823,
            "last_traded_at": 1655576018,
            "expired_at": null
          }
        ]
        """.data(using: .utf8)!
        
    }

    override func tearDown() {
        self.request = nil
        self.jsonData = nil
        
        super.tearDown()
        
    }
    
    func testDerivativesRequestTest_01() {
        XCTAssertTrue(self.request.url == "http://www.test.com/derivatives")
        XCTAssertTrue(self.request.headers == [.accept: .applicationJson])
        XCTAssertTrue(self.request.method == .get)
        XCTAssertTrue(self.request.queryItems == [
            "include_tickers" : "unexpired"
        ])
    }
    
    func testDerivativesRequestTest_02() {
        do {
            let dates = try? self.request.decode(self.jsonData)
            XCTAssertNotNil(dates)
        }
    }
}
