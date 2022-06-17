//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease

class ReusableCellTest: XCTestCase {

    func testReusableCell_01() {

        let reuseIdentifier = TestCell.reuseIdentifier
        XCTAssertEqual(reuseIdentifier, "TestCell")
    }
}
