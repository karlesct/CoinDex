//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease

enum MockErrorEnum: Error {
    case testing
}

class MockLogger: LoggingServiceProtocol {
    
    var capturedMessage: String?
    var capturedString: String?
    var capturedErrorMessage: String?
    
    func log(_ format: String, _ args: CVarArg...) {
        capturedMessage = format
    }
    
    func log(_ message: String) {
        capturedString = message
    }
    
    func log(_ error: Error) {
        capturedErrorMessage = error.localizedDescription
    }
}

class LoggingServiceTest: XCTestCase {

    var mockLogger: MockLogger?
    
    override func setUp() {
        super.setUp()
        
        mockLogger = MockLogger()
        
    }

    override func tearDown() {
        mockLogger = nil
        
        super.tearDown()
        
    }

    func testMDLoggingService_01() {
        
        mockLogger?.log("test", "test")
        XCTAssertEqual(mockLogger?.capturedMessage, "test")
    }
    
    func testMDLoggingService_02() {
        
        mockLogger?.log("Test")
        XCTAssertEqual(mockLogger?.capturedString, "Test")
    }
    
    func testMDLoggingService_03() {
        
        mockLogger?.log(MockErrorEnum.testing)
        XCTAssertEqual(mockLogger?.capturedErrorMessage, MockErrorEnum.testing.localizedDescription)
    }

}
