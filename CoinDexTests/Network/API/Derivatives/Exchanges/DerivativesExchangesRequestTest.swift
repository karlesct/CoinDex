//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease


class DerivativesExchangesRequestTest: XCTestCase {

    var request: DerivativesExchangesRequest!
    var jsonData: Data!

    override func setUp() {
        super.setUp()
        
        self.request = DerivativesExchangesRequest(baseURL: "http://www.test.com")
        
        // The Json to decode
        self.jsonData = """
        [
          {
            "name": "Binance (Futures)",
            "id": "binance_futures",
            "open_interest_btc": 298767.96,
            "trade_volume_24h_btc": "2553858.39",
            "number_of_perpetual_pairs": 206,
            "number_of_futures_pairs": 20,
            "image": "https://assets.coingecko.com/markets/images/466/small/binance_futures.jpg?1568609512",
            "year_established": 2019,
            "country": null,
            "description": "",
            "url": "https://www.binance.com/"
          }
        ]
        """.data(using: .utf8)!
        
    }

    override func tearDown() {
        self.request = nil
        self.jsonData = nil
        
        super.tearDown()
        
    }
    
    func testDerivativesExchangesRequestTest_01() {
        XCTAssertTrue(self.request.url == "http://www.test.com/derivatives/exchanges")
        XCTAssertTrue(self.request.headers == [.accept: .applicationJson])
        XCTAssertTrue(self.request.method == .get)
        XCTAssertTrue(self.request.queryItems == [
                "order" : "unexpired",
                "per_page" : "10",
                "page" : "1"
        ])
    }
    
    func testDerivativesExchangesRequestTest_02() {
        do {
            let dates = try? self.request.decode(self.jsonData)
            XCTAssertNotNil(dates)
        }
    }
}
