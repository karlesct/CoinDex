//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease

class UIColor_HexTest: XCTestCase {

    func testHex_01() {
        XCTAssertNotNil(UIColor(rgb: 0x000000))
    }

}



