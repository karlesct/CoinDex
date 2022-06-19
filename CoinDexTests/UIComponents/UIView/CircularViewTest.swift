//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease

class CircularViewTest: XCTestCase {
    
    var view: CircularView?
    
    override func setUp() {
        super.setUp()
        
        self.view = CircularView(frame: CGRect(origin: .zero,
                                               size: CGSize(width: 10,
                                                            height: 10)))
    }
    
    override func tearDown() {
        self.view = nil
        
        super.tearDown()
        
    }
    
    func testCircularViewTest_01() {
        
        XCTAssertNotNil(self.view)
        
    }
    
    func testCircularViewTest_02() {
        
        self.view?.tintColor = .x555555
        
        XCTAssertTrue(self.view?.tintColor == .x555555)
        
    }
    
    func testCircularViewTest_03() {
        
        self.view?.layer.cornerRadius = 50
        self.view?.layoutSubviews()
        XCTAssertTrue(self.view?.layer.cornerRadius != 50)
        
    }
    
}
