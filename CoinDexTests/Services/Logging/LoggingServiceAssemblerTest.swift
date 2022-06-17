//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease

class LoggingServiceAssemblerTest: XCTestCase {

    var assembler: LoggingServiceAssembler?

    override func setUp() {
        super.setUp()
        
        assembler = LoggingServiceAssembler()
        
    }

    override func tearDown() {
        assembler = nil
        
        super.tearDown()
        
    }

    func testMDLoggingServiceAssembler_01() {
        
        XCTAssertTrue(assembler?.logging() is LoggingServiceProtocol)
        
    }

}
