//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease

class URLRequest_BuilderTest: XCTestCase {

    var urlRequest: URLRequest.Builder?

    override func setUp() {
        super.setUp()
        
        urlRequest = URLRequest.Builder()
        
    }

    override func tearDown() {
        urlRequest = nil
        
        super.tearDown()
        
    }
    
    func testURLRequestBuilder_01() {
        
        XCTAssertTrue(urlRequest != nil)
        
    }
    
    func testURLRequestBuilder_02() {
        
        let item = urlRequest?.with(scheme: "https")
        XCTAssertNotNil(item)
        
    }
    
    func testURLRequestBuilder_03() {
        
        let item = urlRequest?.with(host: "test.com")
        XCTAssertNotNil(item)
        
    }

    func testURLRequestBuilder_04() {
        
        let item = urlRequest?.with(path: "/api")
        XCTAssertNotNil(item)
        
    }
    
    func testURLRequestBuilder_05() {
        
        let item = urlRequest?.with(headers: [
            .accept : .applicationJson
        ])
        XCTAssertNotNil(item)
        
    }
    
    func testURLRequestBuilder_06() {
        
        let item = urlRequest?.with(queryItems: [])
        XCTAssertNotNil(item)
        
    }
    
    func testURLRequestBuilder_07() {
        
        let item = urlRequest?.with(httpMethod: .get)
        XCTAssertNotNil(item)
        
    }
    
    func testURLRequestBuilder_08() {
        
        let item = urlRequest?.with(body: Data())
        XCTAssertNotNil(item)
        
    }
    
    func testURLRequestBuilder_09() {
        
        let item = urlRequest?.build()
        XCTAssertNotNil(item)
        
    }
    
    func testURLRequestBuilder_10() {
        
        let item = urlRequest?
            .with(scheme: "https")
            .with(host: "test.com")
            .with(path: "/api")
            .with(headers: [
                .accept : .applicationJson
            ])
            .with(queryItems: [
                URLQueryItem(name: "q", value: "query")
            ])
            .with(httpMethod: .get)
            .with(body: Data())
            .build()
        XCTAssertNotNil(item)
    }
    
    func testURLRequestBuilder_11() {
        
        let item = urlRequest?
            .with(scheme: "https")
            .with(host: "test.com")
            .with(headers: [
                .accept : .applicationJson
            ])
            .with(queryItems: [
                URLQueryItem(name: "q", value: "query")
            ])
            .with(httpMethod: .get)
            .with(body: Data())
            .build()
        XCTAssertNotNil(item)
    }

}

