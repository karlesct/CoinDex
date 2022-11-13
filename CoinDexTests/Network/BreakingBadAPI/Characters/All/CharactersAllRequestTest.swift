//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease


class CharactersAllRequestTest: XCTestCase {

    var request: CharactersAllRequest!
    var jsonData: Data!

    override func setUp() {
        super.setUp()
        
        self.request = CharactersAllRequest(baseURL: "http://www.test.com")
        
        // The Json to decode
        self.jsonData = """
        [
            {
                "char_id": 1,
                "name": "Walter White",
                "birthday": "09-07-1958",
                "occupation": [
                    "High School Chemistry Teacher",
                    "Meth King Pin"
                ],
                "img": "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg",
                "status": "Presumed dead",
                "nickname": "Heisenberg",
                "appearance": [
                    1,
                    2,
                    3,
                    4,
                    5
                ],
                "portrayed": "Bryan Cranston",
                "category": "Breaking Bad",
                "better_call_saul_appearance": []
            }
        ]
        """.data(using: .utf8)!
        
    }

    override func tearDown() {
        self.request = nil
        self.jsonData = nil
        
        super.tearDown()
        
    }
    
    func testCharactersAllRequestTest_01() {
        XCTAssertTrue(self.request.url == "http://www.test.com/characters")
        XCTAssertTrue(self.request.headers == [.accept: .applicationJson])
        XCTAssertTrue(self.request.method == .get)
    }
    
    func testCharactersAllRequestTest_02() {
        do {
            let dates = try? self.request.decode(self.jsonData)
            XCTAssertNotNil(dates)
        }
    }
}
