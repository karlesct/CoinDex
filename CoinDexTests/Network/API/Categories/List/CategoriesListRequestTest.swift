//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease


class CategoriesListRequestTest: XCTestCase {

    var request: CategoriesListRequest!
    var jsonData: Data!

    override func setUp() {
        super.setUp()
        
        self.request = CategoriesListRequest(baseURL: "http://www.test.com")
        
        // The Json to decode
        self.jsonData = """
        [
          {
            "category_id": "aave-tokens",
            "name": "Aave Tokens"
          }
        ]
        """.data(using: .utf8)!
        
    }

    override func tearDown() {
        self.request = nil
        self.jsonData = nil
        
        super.tearDown()
        
    }
    
    func testCategoriesListRequestTest_01() {
        XCTAssertTrue(self.request.url == "http://www.test.com/coins/categories/list")
        XCTAssertTrue(self.request.headers == [.accept: .applicationJson])
        XCTAssertTrue(self.request.method == .get)
    }
    
    func testCategoriesListRequestTest_02() {
        do {
            let dates = try? self.request.decode(self.jsonData)
            XCTAssertNotNil(dates)
        }
    }
}
