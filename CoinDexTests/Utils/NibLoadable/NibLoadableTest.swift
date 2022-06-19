//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease

class NibLoadableTest: XCTestCase {

    func testNibLoadable_01() {

        let testTableViewCellNibName = TestTableViewCell.nibName
        XCTAssertEqual(testTableViewCellNibName, "TestTableViewCell")
    }

    func testNibLoadable_02() {

        let testTableViewCell = TestTableViewCell.instantiate()
        XCTAssertNotNil(testTableViewCell)
    }

}
