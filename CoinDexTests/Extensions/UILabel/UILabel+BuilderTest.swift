//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease

class UILabel_BuilderTest: XCTestCase {

    var label: UILabel.Builder?

    override func setUp() {
        super.setUp()
        
        label = UILabel.Builder()
        
    }

    override func tearDown() {
        label = nil
        
        super.tearDown()
        
    }
    
    func testLabelBuilder_01() {
        
        XCTAssertTrue(label != nil)
        
    }
    
    func testLabelBuilder_02() {
        
        let item = label?.with(text: "iconClip")
        XCTAssertNotNil(item)
        
    }
    
    func testLabelBuilder_03() {
        
        let item = label?.with(font: .systemFont(ofSize: 10))
        XCTAssertNotNil(item)
        
    }

    func testLabelBuilder_04() {
        
        let item = label?.with(textColor: .x555555)
        XCTAssertNotNil(item)
        
    }
    
    func testLabelBuilder_05() {
        
        let item = label?.with(textAlignment: .center)
        XCTAssertNotNil(item)
        
    }
    
    func testLabelBuilder_06() {
        
        let item = label?.with(numberOfLines: 0)
        XCTAssertNotNil(item)
        
    }
    
    func testLabelBuilder_07() {
        
        let item = label?
            .with(text: "iconClip")
            .with(font: .systemFont(ofSize: 10))
            .with(textColor: .x555555)
            .with(textAlignment: .center)
            .with(numberOfLines: 0)
            .build()
        XCTAssertNotNil(item)
    }
    
    func testLabelBuilder_08() {
        
        let item = label?
            .with(text: "iconClip")
            .build()
        XCTAssertNotNil(item)
    }

}
