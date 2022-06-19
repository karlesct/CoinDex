//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease

struct MockModel: Codable {
    var test: String
}

// Data structure
struct MockDataRequest: DataRequest {
    let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL
    }

    var url: String {
        return baseURL + path
    }

    var path: String {
        return "/test"
    }

    var headers: [HTTPHeaderKey: HTTPHeaderValue] {
        [
            .accept: .applicationJson,
            .cacheControl: .noCache
        ]
    }

    var method: HTTPMethod {
        .get
    }
    
    func decode(_ data: Data) throws -> MockModel {
        let decoder = JSONDecoder()
        let response = try decoder.decode(MockModel.self, from: data)
        return response
    }
}

class DataRequest_GetURLRequestTest: XCTestCase {

    var request: MockDataRequest!
    var jsonData: Data!

    override func setUp() {
        super.setUp()
        
        self.request = MockDataRequest(baseURL: "http://www.test.com")
        
        // The Json to decode
        self.jsonData = """
        {
            "test": "testResponse",
        }
        """.data(using: .utf8)!
        
    }

    override func tearDown() {
        self.request = nil
        self.jsonData = nil
        
        super.tearDown()
        
    }
    
    func testDataRequest_GetURLRequestTests_01() {
        let url = URL(string: "http://www.test.com")!
        let result = self.request.getURLRequest(url)
        XCTAssertNotNil(result)
    }
    
}
