//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease

class UIButton_BuilderTest: XCTestCase {

    var button: UIButton.Builder?

    override func setUp() {
        super.setUp()
        
        button = UIButton.Builder()
        
    }

    override func tearDown() {
        button = nil
        
        super.tearDown()
        
    }
    
    func testButtonBuilder_01() {
        
        XCTAssertNotNil(button != nil)
        
    }
    
    func testButtonBuilder_02() {
        
        let item = button?.with(text: "text")
        XCTAssertNotNil(item != nil)
        
    }
    
    func testButtonBuilder_03() {
        
        let item = button?.with(font: .systemFont(ofSize: 18))
        XCTAssertNotNil(item != nil)
        
    }

    func testButtonBuilder_04() {
        
        let item = button?.with(textColor: .x555555)
        XCTAssertNotNil(item != nil)
        
    }
    
    func testButtonBuilder_05() {
        
        let item = button?.with(backgroundColor: .x00FFFFFF)
        XCTAssertNotNil(item != nil)
        
    }
    
    func testButtonBuilder_06() {
        
        let item = button?.with(height: 10)
        XCTAssertNotNil(item != nil)
        
    }
    
    func testButtonBuilder_07() {
        
        let item = button?.with(cornerRadius: 5)
        XCTAssertNotNil(item != nil)
        
    }
    
    func testButtonBuilder_08() {
        
        let item = button?.with(topInset: 5)
        XCTAssertNotNil(item != nil)
        
    }
    
    func testButtonBuilder_09() {
        
        let item = button?.with(leftInset: 5)
        XCTAssertNotNil(item != nil)
        
    }
    
    func testButtonBuilder_10() {
        
        let item = button?.with(bottomInset: 5)
        XCTAssertNotNil(item != nil)
        
    }
    
    func testButtonBuilder_11() {
        
        let item = button?.with(rightInset: 5)
        XCTAssertNotNil(item != nil)
        
    }
    
    func testButtonBuilder_12() {
        
        let item = button?.with(target: self,
                                selector: #selector(self.testAction),
                                controlEvent: .touchUpInside)
        XCTAssertNotNil(item != nil)
        
    }
    
    func testButtonBuilder_13() {
        let action = UIButton.ButtonAction(target: self,
                                           selector: #selector(self.testAction),
                                           controlEvent: .touchUpInside)
        let item = button?.with(buttonAction: action)
        XCTAssertNotNil(item != nil)
        
    }
    
    @objc func testAction() {
        
    }
    
    
    func testButtonBuilder_14() {
        
        let item = button?.build()
        XCTAssertNotNil(item != nil)
        
    }
    
    func testButtonBuilder_15() {
        
        let item = button?
            .with(text: "text")
            .with(font: .systemFont(ofSize: 18))
            .with(textColor: .x555555)
            .with(backgroundColor: .x00FFFFFF)
            .with(height: 10)
            .with(cornerRadius: 5)
            .with(topInset: 5)
            .with(leftInset: 5)
            .with(bottomInset: 5)
            .with(rightInset: 5)
            .with(target: self,
                  selector: #selector(self.testAction),
                  controlEvent: .touchUpInside)
            .build()
        XCTAssertNotNil(item)

    }

}
