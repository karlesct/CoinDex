//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease


class CategoriesRequestTest: XCTestCase {

    var request: CategoriesRequest!
    var jsonData: Data!

    override func setUp() {
        super.setUp()
        
        self.request = CategoriesRequest(baseURL: "http://www.test.com",
                                         order: .marketCapAsc)
        
        // The Json to decode
        self.jsonData = """
        [
          {
            "id": "ethereum-ecosystem",
            "name": "Ethereum Ecosystem",
            "market_cap": 348528548849.3711,
            "market_cap_change_24h": -2.950725617652599,
            "content": "",
            "top_3_coins": [
              "https://assets.coingecko.com/coins/images/279/small/ethereum.png?1595348880",
              "https://assets.coingecko.com/coins/images/325/small/Tether-logo.png?1598003707",
              "https://assets.coingecko.com/coins/images/6319/small/USD_Coin_icon.png?1547042389"
            ],
            "volume_24h": 116856988989.59846,
            "updated_at": "2022-06-19T07:47:30.427Z"
          }
        ]
        """.data(using: .utf8)!
        
    }

    override func tearDown() {
        self.request = nil
        self.jsonData = nil
        
        super.tearDown()
        
    }
    
    func testCategoriesRequestTest_01() {
        XCTAssertTrue(self.request.url == "http://www.test.com/coins/categories")
        XCTAssertTrue(self.request.headers == [.accept: .applicationJson])
        XCTAssertTrue(self.request.method == .get)
        XCTAssertTrue(self.request.queryItems == [
            "order" : "market_cap_asc"
        ])
    }
    
    func testCategoriesRequestTest_02() {
        do {
            let dates = try? self.request.decode(self.jsonData)
            XCTAssertNotNil(dates)
        }
    }
}
