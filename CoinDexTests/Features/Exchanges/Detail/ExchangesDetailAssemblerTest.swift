//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease

class ExchangesDetailAssemblerTest: XCTestCase {

    var assembler: ExchangesDetailAssembler?

    override func setUp() {
        super.setUp()
        
        self.assembler = ExchangesDetailAssembler(id: "10")
        
    }

    override func tearDown() {
        self.assembler = nil
        
        super.tearDown()
        
    }

    func testExchangesDetailAssemblerTest_01() {
        
        XCTAssertTrue(self.assembler?.viewController() is UIViewController)
        
    }

}
