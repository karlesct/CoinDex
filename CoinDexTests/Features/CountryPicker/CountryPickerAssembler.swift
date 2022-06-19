//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease

class CountryPickerAssemblerTest: XCTestCase {

    var assembler: CountryPickerAssembler?

    override func setUp() {
        super.setUp()
        
        self.assembler = CountryPickerAssembler()
        
    }

    override func tearDown() {
        self.assembler = nil
        
        super.tearDown()
        
    }

    func testCountryPickerAssemblerTest_01() {
        
        XCTAssertTrue(self.assembler?.viewController() is UIViewController)
        
    }

}
