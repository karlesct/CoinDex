//
//  Copyright © 2022 CCT. All rights reserved.
//

import XCTest
@testable import CoinDexRelease

class UIAlertController_BuilderTest: XCTestCase {

    var alert: UIAlertController.Builder?

    override func setUp() {
        super.setUp()
        
        alert = UIAlertController.Builder()
        
    }

    override func tearDown() {
        alert = nil
        
        super.tearDown()
        
    }
    
    func testAlertBuilder_01() {
        
        XCTAssertTrue(alert != nil)
        
    }
    
    func testAlertBuilder_02() {
        
        let item = alert?.with(preferredStyle: .alert)
        XCTAssertTrue(item != nil)
        
    }
    
    func testAlertBuilder_03() {
        
        let item = alert?.with(title: "title")
        XCTAssertTrue(item != nil)
        
    }

    func testAlertBuilder_04() {
        
        let item = alert?.with(message: "message")
        XCTAssertTrue(item != nil)
        
    }
    
    func testAlertBuilder_05() {
        
        let item = alert?.with(alertActions: [UIAlertAction()])
        XCTAssertTrue(item != nil)
        
    }
    
    func testAlertBuilder_06() {
        
        let item = alert?.with(sourceView: UIView())
        XCTAssertTrue(item != nil)
        
    }
    
    func testAlertBuilder_07() {
        
        let item = alert?.with(sourceRect: CGRect())
        XCTAssertTrue(item != nil)
        
    }
    
    func testAlertBuilder_08() {
        
        let item = alert?.addAction(title: "title")
        XCTAssertTrue(item != nil)
        
    }
    
    func testAlertBuilder_09() {
        
        let item = alert?.addAction(title:"title", alertActionStyle: .default, handler: nil)
        XCTAssertTrue(item != nil)
        
    }
    
    func testAlertBuilder_10() {
        
        let item = alert?.with(permittedArrowDirections: .any)
        XCTAssertTrue(item != nil)
        
    }
    
    func testAlertBuilder_11() {
        
        let item = alert?.build()
        XCTAssertTrue(item != nil)
        
    }
    
    func testAlertBuilder_12() {
        
        let item = alert?.with(title: "title")
            .with(message: "message")
            .with(sourceRect: CGRect())
            .with(sourceView: UIView())
            .with(permittedArrowDirections: .down)
            .with(alertActions: [
                UIAlertAction(title: "action1", style: .default)
            ])
            .build()
        XCTAssertTrue(item != nil)
    }

}
