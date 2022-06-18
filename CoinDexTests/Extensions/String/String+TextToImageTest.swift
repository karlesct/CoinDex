//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease

class String_TextToImageTest: XCTestCase {

    func testTextToImage_01() {

        XCTAssertNotNil("😱".textToImage(with: .systemFont(ofSize: 18)))
    }
    
    func testTextToImage_02() {

        XCTAssertEqual("".textToImage(with: .systemFont(ofSize: 18)), UIImage())
    }

}
