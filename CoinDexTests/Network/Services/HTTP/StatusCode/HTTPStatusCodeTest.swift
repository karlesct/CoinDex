//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease

class HTTPStatusCodeTest: XCTestCase {
    
    func testHTTPStatusCodeTest_01() {
        
        let status = HTTPStatusCode.`continue`.responseType
        
        XCTAssertEqual(status, .informational)
    }
    
    func testHTTPStatusCodeTest_02() {
        
        let status = HTTPStatusCode.ok.responseType
        
        XCTAssertEqual(status, .success)
    }
    
    func testHTTPStatusCodeTest_03() {
        
        let status = HTTPStatusCode.multipleChoices.responseType
        
        XCTAssertEqual(status, .redirection)
    }
    
    func testHTTPStatusCodeTest_04() {
        
        let status = HTTPStatusCode.badRequest.responseType
        
        XCTAssertEqual(status, .clientError)
    }
    
    func testHTTPStatusCodeTest_05() {
        
        let status = HTTPStatusCode.internalServerError.responseType
        
        XCTAssertEqual(status, .serverError)
    }

    func testHTTPStatusCodeTest_06() {
        guard let url = URL(string: "https://www.coingecko.com/en/api/documentation") else { return }
        let status = HTTPURLResponse(url: url,
                                     statusCode: 1000,
                                     httpVersion: nil,
                                     headerFields: nil)
        
        XCTAssertEqual(status?.status?.responseType, .undefined)
    }

}
