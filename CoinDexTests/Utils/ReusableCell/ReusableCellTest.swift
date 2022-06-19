//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease

class ReusableCellTest: XCTestCase {

    func testReusableCell_01() {

        let reuseIdentifier = TestTableViewCell.reuseIdentifier
        XCTAssertEqual(reuseIdentifier, "TestTableViewCell")
    }
    
    func testReusableCell_02() {

        let reuseIdentifier = TestCollectionViewCell.reuseIdentifier
        XCTAssertEqual(reuseIdentifier, "TestCollectionViewCell")
    }
}
