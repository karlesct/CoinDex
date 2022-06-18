//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease


class TrendingRequestTest: XCTestCase {

    var request: TrendingRequest!
    var jsonData: Data!

    override func setUp() {
        super.setUp()
        
        self.request = TrendingRequest(baseURL: "http://www.test.com")
        
        // The Json to decode
        self.jsonData = """
        {
          "coins": [
            {
              "item": {
                "id": "magic-internet-money",
                "coin_id": 16786,
                "name": "Magic Internet Money",
                "symbol": "MIM",
                "market_cap_rank": 143,
                "thumb": "https://assets.coingecko.com/coins/images/16786/thumb/mimlogopng.png?1624979612",
                "small": "https://assets.coingecko.com/coins/images/16786/small/mimlogopng.png?1624979612",
                "large": "https://assets.coingecko.com/coins/images/16786/large/mimlogopng.png?1624979612",
                "slug": "magic-internet-money",
                "price_btc": 0.000053069981602314476,
                "score": 0
              }
            },
            {
              "item": {
                "id": "usdd",
                "coin_id": 25380,
                "name": "USDD",
                "symbol": "USDD",
                "market_cap_rank": 61,
                "thumb": "https://assets.coingecko.com/coins/images/25380/thumb/UUSD.jpg?1651823371",
                "small": "https://assets.coingecko.com/coins/images/25380/small/UUSD.jpg?1651823371",
                "large": "https://assets.coingecko.com/coins/images/25380/large/UUSD.jpg?1651823371",
                "slug": "usdd",
                "price_btc": 0.0000519387866357808,
                "score": 1
              }
            },
            {
              "item": {
                "id": "celsius-degree-token",
                "coin_id": 3263,
                "name": "Celsius Network",
                "symbol": "CEL",
                "market_cap_rank": 137,
                "thumb": "https://assets.coingecko.com/coins/images/3263/thumb/CEL_logo.png?1609598753",
                "small": "https://assets.coingecko.com/coins/images/3263/small/CEL_logo.png?1609598753",
                "large": "https://assets.coingecko.com/coins/images/3263/large/CEL_logo.png?1609598753",
                "slug": "celsius-network-token",
                "price_btc": 0.000026783649654736413,
                "score": 2
              }
            },
            {
              "item": {
                "id": "bitcoin",
                "coin_id": 1,
                "name": "Bitcoin",
                "symbol": "BTC",
                "market_cap_rank": 1,
                "thumb": "https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1547033579",
                "small": "https://assets.coingecko.com/coins/images/1/small/bitcoin.png?1547033579",
                "large": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
                "slug": "bitcoin",
                "price_btc": 1,
                "score": 3
              }
            },
            {
              "item": {
                "id": "evmos",
                "coin_id": 24023,
                "name": "Evmos",
                "symbol": "EVMOS",
                "market_cap_rank": 105,
                "thumb": "https://assets.coingecko.com/coins/images/24023/thumb/evmos.png?1653958927",
                "small": "https://assets.coingecko.com/coins/images/24023/small/evmos.png?1653958927",
                "large": "https://assets.coingecko.com/coins/images/24023/large/evmos.png?1653958927",
                "slug": "evmos",
                "price_btc": 0.00007931550514178137,
                "score": 4
              }
            },
            {
              "item": {
                "id": "ethereum",
                "coin_id": 279,
                "name": "Ethereum",
                "symbol": "ETH",
                "market_cap_rank": 2,
                "thumb": "https://assets.coingecko.com/coins/images/279/thumb/ethereum.png?1595348880",
                "small": "https://assets.coingecko.com/coins/images/279/small/ethereum.png?1595348880",
                "large": "https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880",
                "slug": "ethereum",
                "price_btc": 0.05168905257950465,
                "score": 5
              }
            },
            {
              "item": {
                "id": "yield-app",
                "coin_id": 13365,
                "name": "YIELD App",
                "symbol": "YLD",
                "market_cap_rank": 620,
                "thumb": "https://assets.coingecko.com/coins/images/13365/thumb/Icon_Blue.png?1607917500",
                "small": "https://assets.coingecko.com/coins/images/13365/small/Icon_Blue.png?1607917500",
                "large": "https://assets.coingecko.com/coins/images/13365/large/Icon_Blue.png?1607917500",
                "slug": "yield-app",
                "price_btc": 0.000005446619936873804,
                "score": 6
              }
            }
          ],
          "exchanges": []
        }
        """.data(using: .utf8)!
        
    }

    override func tearDown() {
        self.request = nil
        self.jsonData = nil
        
        super.tearDown()
        
    }
    
    func testTrendingRequestTest_01() {
        XCTAssertTrue(self.request.url == "http://www.test.com/search/trending")
        XCTAssertTrue(self.request.headers == [.accept: .applicationJson])
        XCTAssertTrue(self.request.method == .get)
    }
    
    func testTrendingRequestTest_02() {
        do {
            let dates = try? self.request.decode(self.jsonData)
            XCTAssertNotNil(dates)
        }
    }
}
