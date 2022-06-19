//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease


class UIStackView_BuilderTest: XCTestCase {

    var stackView: UIStackView.Builder?

    override func setUp() {
        super.setUp()
        
        self.stackView = UIStackView.Builder()
        
    }

    override func tearDown() {
        self.stackView = nil
        
        super.tearDown()
        
    }
    
    func testUIStackView_BuilderTest_01() {
        
        XCTAssertTrue(self.stackView != nil)
        
    }
    
    func testUIStackView_BuilderTest_02() {
        
        let item = self.stackView?.with(axis: .horizontal)
        XCTAssertNotNil(item)
        
    }
    
    func testUIStackView_BuilderTest_03() {
        
        let item = self.stackView?.with(distribution: .fill)
        XCTAssertNotNil(item)
        
    }

    func testUIStackView_BuilderTest_04() {
        
        let item = self.stackView?.with(alignment: .fill)
        XCTAssertNotNil(item)
        
    }
    
    func testUIStackView_BuilderTest_05() {
        
        let item = self.stackView?.with(spacing: 5)
        XCTAssertNotNil(item)
        
    }
    
    func testUIStackView_BuilderTest_06() {
        
        let item = self.stackView?.with(arrangedSubview: UIView())
        XCTAssertNotNil(item)
        
    }
    
    func testUIStackView_BuilderTest_07() {
        
        let item = self.stackView?.with(arrangedSubviews: [
            UIView(),
            UIView()
        ])
        XCTAssertNotNil(item)
        
    }
    
    func testUIStackView_BuilderTest_08() {
        
        let item = self.stackView?
            .with(axis: .horizontal)
            .with(distribution: .fill)
            .with(alignment: .fill)
            .with(spacing: 5)
            .with(arrangedSubview: UIView())
            .build()
        XCTAssertNotNil(item)
    }
    
    func testUIStackView_BuilderTest_09() {
        
        let item = self.stackView?
            .with(axis: .horizontal)
            .with(spacing: 5)
            .with(arrangedSubview: UIView())
            .build()
        XCTAssertNotNil(item)
    }

}
