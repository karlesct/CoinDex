//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease

class String_GetFlagTest: XCTestCase {

    func testGetFlag_01() {

        XCTAssertEqual("ES".getFlag(), "🇪🇸")
    }

}
