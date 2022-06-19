//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease

class ExchangesDetailAssemblerTest: XCTestCase {

    var assembler: ExchangesDetailAssembler?

    override func setUp() {
        super.setUp()
        
        assembler = ExchangesDetailAssembler(id: "10")
        
    }

    override func tearDown() {
        assembler = nil
        
        super.tearDown()
        
    }

    func testMDLoggingServiceAssembler_01() {
        
        XCTAssertTrue(assembler?.viewController() is UIViewController)
        
    }

}
