//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease

class UIImageView_BuilderTest: XCTestCase {

    var imageView: UIImageView.Builder?

    override func setUp() {
        super.setUp()
        
        imageView = UIImageView.Builder()
        
    }

    override func tearDown() {
        imageView = nil
        
        super.tearDown()
        
    }
    
    func testImageViewBuilder_01() {
        
        XCTAssertTrue(imageView != nil)
        
    }
    
    func testImageViewBuilder_02() {
        
        let item = imageView?.with(image: UIImage())
        XCTAssertNotNil(item)
        
    }
    
    func testImageViewBuilder_03() {
        
        let item = imageView?.with(tintColor: .xFFFFFF)
        XCTAssertNotNil(item)
        
    }

    
    func testImageViewBuilder_04() {
        
        let item = imageView?.with(height: 10)
        XCTAssertNotNil(item)
        
    }
    
    func testImageViewBuilder_05() {
        
        let item = imageView?.with(width: 10)
        XCTAssertNotNil(item)
        
    }
    
    func testImageViewBuilder_06() {
        
        let item = imageView?
            .with(image: UIImage())
            .with(tintColor: .xFFFFFF)
            .with(height: 10)
            .with(width: 10)
            .build()
        XCTAssertNotNil(item)
    }
    
    func testImageViewBuilder_07() {
        
        let item = imageView?
            .build()
        XCTAssertNotNil(item)
    }

}
