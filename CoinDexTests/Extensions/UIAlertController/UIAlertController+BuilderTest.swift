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
        XCTAssertNotNil(item)
        
    }
    
    func testAlertBuilder_03() {
        
        let item = alert?.with(title: "title")
        XCTAssertNotNil(item)
        
    }

    func testAlertBuilder_04() {
        
        let item = alert?.with(message: "message")
        XCTAssertNotNil(item)
        
    }
    
    func testAlertBuilder_05() {
        
        let item = alert?.with(alertActions: [UIAlertAction()])
        XCTAssertNotNil(item)
        
    }
    
    func testAlertBuilder_06() {
        
        let item = alert?.with(sourceView: UIView())
        XCTAssertNotNil(item)
        
    }
    
    func testAlertBuilder_07() {
        
        let item = alert?.with(sourceRect: CGRect())
        XCTAssertNotNil(item)
        
    }
    
    func testAlertBuilder_08() {
        
        let item = alert?.addAction(title: "title")
        XCTAssertNotNil(item)
        
    }
    
    func testAlertBuilder_09() {
        
        let item = alert?.addAction(title:"title", alertActionStyle: .default, handler: nil)
        XCTAssertNotNil(item)
        
    }
    
    func testAlertBuilder_10() {
        
        let item = alert?.with(permittedArrowDirections: .any)
        XCTAssertNotNil(item)
        
    }
    
    func testAlertBuilder_11() {
        
        let item = alert?.build()
        XCTAssertNotNil(item)
        
    }
    
    func testAlertBuilder_12() {
        
        let item = alert?
            .with(title: "title")
            .with(message: "message")
            .with(sourceRect: CGRect())
            .with(sourceView: UIView())
            .with(permittedArrowDirections: .down)
            .with(alertActions: [
                UIAlertAction(title: "action1", style: .default)
            ])
            .build()
        XCTAssertNotNil(item)
    }

}
