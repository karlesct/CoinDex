//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease

class String_RegexTest: XCTestCase {
    
    func testRegex_01() {
        
        XCTAssertEqual("1234abcd-ab12-12ab-ab12-abcdef123456".match(regex: .room), true)
        XCTAssertEqual("test".match(regex: .room), false)
    }
    
    func testRegex_02() {
        XCTAssertEqual("a".match(regex: .repeatedCharacters), false)
        XCTAssertEqual("a2p".match(regex: .repeatedCharacters), false)
        XCTAssertEqual("aaa".match(regex: .repeatedCharacters), true)
        
    }
    
    func testRegex_03() {
        XCTAssertEqual("9".match(regex: .serialNumbers), false)
        XCTAssertEqual("913".match(regex: .serialNumbers), false)
        XCTAssertEqual("012".match(regex: .serialNumbers), true)
        
    }
    
    func testRegex_04() {
        XCTAssertEqual("d".match(regex: .serialCharacters), false)
        XCTAssertEqual("azd".match(regex: .serialCharacters), false)
        XCTAssertEqual("abc".match(regex: .serialCharacters), true)
        
    }
    
    func testRegex_05() {
        XCTAssertEqual("d".match(regex: .specialCharacters), false)
        XCTAssertEqual("azd".match(regex: .specialCharacters), false)
        XCTAssertEqual("!<>".match(regex: .specialCharacters), true)
        
    }
    
    func testRegex_06() {
        XCTAssertEqual("".match(regex: .containNumbers), false)
        XCTAssertEqual("pp".match(regex: .containNumbers), false)
        XCTAssertEqual("10".match(regex: .containNumbers), true)
        
    }
    
    func testRegex_07() {
        XCTAssertEqual("".match(regex: .hasLowerAndUpper), false)
        XCTAssertEqual("test".match(regex: .hasLowerAndUpper), false)
        XCTAssertEqual("TEST".match(regex: .hasLowerAndUpper), false)
        XCTAssertEqual("TeSt".match(regex: .hasLowerAndUpper), true)
        
    }
    
}
