//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease

class NibLoadableTest: XCTestCase {

    func testNibLoadable_01() {

        let testCellNibName = TestCell.nibName
        XCTAssertEqual(testCellNibName, "TestCell")
    }

    func testNibLoadable_02() {

        let testCell = TestCell.instantiate()
        XCTAssertNotNil(testCell)
    }

}
