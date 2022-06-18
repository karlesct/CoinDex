//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease


class CompaniesRequestTest: XCTestCase {

    var request: CompaniesRequest!
    var jsonData: Data!

    override func setUp() {
        super.setUp()
        
        self.request = CompaniesRequest(baseURL: "http://www.test.com")
        
        // The Json to decode
        self.jsonData = """
        {
          "total_holdings": 225413.6658,
            "total_value_usd": 4218279358.1232224,
            "market_cap_dominance": 1.18,
            "companies": [
              {
                "name": "MicroStrategy Inc.",
                "symbol": "NASDAQ:MSTR",
                "country": "US",
                "total_holdings": 129218,
                "total_entry_value_usd": 3970000000,
                "total_current_value_usd": 2418121457,
                "percentage_of_total_supply": 0.615
              }]
        }
        """.data(using: .utf8)!
        
    }

    override func tearDown() {
        self.request = nil
        self.jsonData = nil
        
        super.tearDown()
        
    }
    
    func testCompaniesRequestTest_01() {
        XCTAssertTrue(self.request.url == "http://www.test.com/companies/public_treasury/bitcoin")
        XCTAssertTrue(self.request.headers == [.accept: .applicationJson])
        XCTAssertTrue(self.request.method == .get)
        XCTAssertTrue(self.request.queryItems == [
            "coin_id" : "bitcoin"          // bitcoin or ethereum
        ])
    }
    
    func testCompaniesRequestTest_02() {
        do {
            let dates = try? self.request.decode(self.jsonData)
            XCTAssertNotNil(dates)
        }
    }
}
