//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease

class CountryModelTest: XCTestCase {

    var model: CountryModel?
    var modelKO: CountryModel?

    override func setUp() {
        super.setUp()
        
        self.model = CountryModel(phoneCode: "34",
                                  isoCode: "ES")
        
        self.modelKO = CountryModel(phoneCode: "34",
                                  isoCode: "CCT")
        
    }

    override func tearDown() {
        self.model = nil
        self.modelKO = nil
        
        super.tearDown()
        
    }

    func testCountryModelTest_01() {
        XCTAssertTrue(self.model?.phoneCode == "34")
        XCTAssertTrue(self.model?.isoCode == "ES")
    }

    
    func testCountryModelTest_02() {
        XCTAssertTrue(self.model?.localizedName == "España")
    }
    
    func testCountryModelTest_03() {
        XCTAssertTrue(self.modelKO?.localizedName == "CCT")
    }

}
