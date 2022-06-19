//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease


class SearchRequestTest: XCTestCase {

    var request: SearchRequest!
    var jsonData: Data!

    override func setUp() {
        super.setUp()
        
        self.request = SearchRequest(baseURL: "http://www.test.com",
                                     query: "bitcoin")
        
        // The Json to decode
        self.jsonData = """
        {
          "coins": [
            {
              "id": "bitcoin",
              "name": "Bitcoin",
              "symbol": "BTC",
              "market_cap_rank": 1,
              "thumb": "https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png",
              "large": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png"
            }
          ],
          "exchanges": [
            {
              "id": "mercado_bitcoin",
              "name": "Mercado Bitcoin",
              "market_type": "spot",
              "thumb": "https://assets.coingecko.com/markets/images/34/thumb/icon-256.png",
              "large": "https://assets.coingecko.com/markets/images/34/large/icon-256.png"
            }
          ],
          "categories": [
            {
              "id": 1,
              "name": "Artificial Intelligence"
            }
          ],
          "nfts": [
            {
              "id": "nft-worlds",
              "name": "NFT Worlds",
              "symbol": "NFT WORLDS",
              "thumb": "https://assets.coingecko.com/nft_contracts/images/282/thumb/nft-worlds.gif"
            }
          ]
        }
        """.data(using: .utf8)!
        
    }

    override func tearDown() {
        self.request = nil
        self.jsonData = nil
        
        super.tearDown()
        
    }
    
    func testSearchRequestTest_01() {
        XCTAssertTrue(self.request.url == "http://www.test.com/search")
        XCTAssertTrue(self.request.headers == [.accept: .applicationJson])
        XCTAssertTrue(self.request.method == .get)
        XCTAssertTrue(self.request.queryItems == [
            "query" : "bitcoin"           // Search string
        ])
    }
    
    func testSearchRequestTest_02() {
        do {
            let dates = try? self.request.decode(self.jsonData)
            XCTAssertNotNil(dates)
        }
    }
}
