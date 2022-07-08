import XCTest
@testable import CoinDexRelease


class Date_IsInFutureTest: XCTestCase {
    
    func testsInFuture_01() {
        let date: Date! = Calendar.current.date(byAdding: .day,
                                                value: 10,
                                                to: Date())
        
        let isInFuture = date.isInFuture
        
        XCTAssertTrue(isInFuture)
    }
}
