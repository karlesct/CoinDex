//
//  Copyright © 2022 CCT. All rights reserved.
//

import XCTest
@testable import CoinDexRelease

class ViewController_GetTopViewControllerTest: XCTestCase {

    var viewController: UIViewController!

    override func setUp() {
        super.setUp()

        viewController = UIViewController().getTopViewController

    }

    func testGetTopViewController_01() {
        XCTAssertNotNil(viewController)
    }

}
