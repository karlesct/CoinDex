//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease


class CoinsMarketsRequestTest: XCTestCase {

    var request: CoinsMarketsRequest!
    var jsonData: Data!

    override func setUp() {
        super.setUp()
        
        self.request = CoinsMarketsRequest(baseURL: "http://www.test.com")
        
        // The Json to decode
        self.jsonData = """
        [
          {
            "id": "newscrypto-coin",
            "symbol": "nwc",
            "name": "Newscrypto Coin",
            "image": "https://assets.coingecko.com/coins/images/9805/large/Tu1_NI3s_%281%29.png?1614745476",
            "current_price": 0.065283,
            "market_cap": 9633323,
            "market_cap_rank": 784,
            "fully_diluted_valuation": 18222797,
            "total_volume": 114551,
            "high_24h": 0.065477,
            "low_24h": 0.057735,
            "price_change_24h": 0.00393242,
            "price_change_percentage_24h": 6.40979,
            "market_cap_change_24h": 495394,
            "market_cap_change_percentage_24h": 5.4213,
            "circulating_supply": 148019569.004227,
            "total_supply": 270050481,
            "max_supply": 280000000,
            "ath": 1.84,
            "ath_change_percentage": -96.46036,
            "ath_date": "2021-05-03T11:59:00.980Z",
            "atl": 0.01307955,
            "atl_change_percentage": 397.58134,
            "atl_date": "2019-11-16T00:33:47.874Z",
            "roi": null,
            "last_updated": "2022-06-19T08:29:29.407Z"
          }
        ]
        """.data(using: .utf8)!
        
    }

    override func tearDown() {
        self.request = nil
        self.jsonData = nil
        
        super.tearDown()
        
    }
    
    func testCoinsMarketsRequestTest_01() {
        XCTAssertTrue(self.request.url == "http://www.test.com/coins/markets")
        XCTAssertTrue(self.request.headers == [.accept: .applicationJson])
        XCTAssertTrue(self.request.method == .get)
        XCTAssertTrue(self.request.queryItems == [
            "vs_currency" : "eur",                // the target currency of market data (usd, eur, jpy, etc.)
            "id" : "bitcoin",              // The ids of the coin, comma separated crytocurrency symbols (base). refers to /coins/list.
                                        // When left empty, returns numbers the coins observing the params limit and start
            "category" : "10",                     // filter by coin category. Refer to /coin/categories/list
            "order" : "market_cap_desc",           // valid values: market_cap_desc, gecko_desc, gecko_asc, market_cap_asc, market_cap_desc, volume_asc, volume_desc, id_asc, id_desc
                                                    // sort results by field. | Default value : market_cap_desc
            "per_page" : "100",                     // valid values: 1..250 | Total results per page | Default value : 100
            "page" : "1",                     // Page through results |  Default value : 1
            "sparkline" : "1",                     // Include sparkline 7 days data (eg. true, false) |  Default value : false
            "price_change_percentage" : "1",                     // Include price change percentage in 1h, 24h, 7d, 14d, 30d, 200d, 1y (eg. '1h,24h,7d' comma-separated, invalid values will be discarded)
        ])
    }
    
    func testCoinsMarketsRequestTest_02() {
        do {
            let dates = try? self.request.decode(self.jsonData)
            XCTAssertNotNil(dates)
        }
    }
}
