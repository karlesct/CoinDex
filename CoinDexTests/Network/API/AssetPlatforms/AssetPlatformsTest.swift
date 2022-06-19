//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease


class AssetPlatformsTest: XCTestCase {

    var request: AssetPlatformsRequest!
    var jsonData: Data!

    override func setUp() {
        super.setUp()
        
        self.request = AssetPlatformsRequest(baseURL: "http://www.test.com")
        
        // The Json to decode
        self.jsonData = """
        [
          {
            "id": "factom",
            "chain_identifier": null,
            "name": "Factom",
            "shortname": ""
          }
        ]
        """.data(using: .utf8)!
        
    }

    override func tearDown() {
        self.request = nil
        self.jsonData = nil
        
        super.tearDown()
        
    }
    
    func testAssetPlatformsTest_01() {
        XCTAssertTrue(self.request.url == "http://www.test.com/asset_platforms")
        XCTAssertTrue(self.request.headers == [.accept: .applicationJson])
        XCTAssertTrue(self.request.method == .get)
    }
    
    func testAssetPlatformsTest_02() {
        do {
            let dates = try? self.request.decode(self.jsonData)
            XCTAssertNotNil(dates)
        }
    }
}
