//
//  Copyright © 2022 CCT. All rights reserved.
//

import XCTest
@testable import CoinDexRelease

class String_LocalizedTest: XCTestCase {

    func testLocalized_01() {

        XCTAssertEqual("missing_key".localized, "**missing_key**")
    }

    func testLocalized_02() {

        XCTAssertEqual("app_missing_key".localized, "**app_missing_key**")
    }

    func testLocalized_03() {

        XCTAssertEqual("literal_retry".localized, "Retry")
        XCTAssertEqual("literal_information".localized, "Information")
    }
    

}
