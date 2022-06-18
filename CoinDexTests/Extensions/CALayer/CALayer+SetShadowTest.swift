//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease

class CALayer_SetShadowTest: XCTestCase {
    
    var view: UIView!

    override func setUp() {
        super.setUp()

        view = UIView()
        view.layer.setShadow()
    }

    override func tearDown() {
        view = nil
        
        super.tearDown()
    }
    
    func testSetShadow_01() {
        XCTAssertEqual(view.layer.masksToBounds, false)
        XCTAssertEqual(view.layer.shadowColor, UIColor.x000000.cgColor)
        XCTAssertEqual(view.layer.shadowOpacity, 0.3)
        XCTAssertEqual(view.layer.shadowOffset, .zero)
    }

}
