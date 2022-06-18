//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease

class UIWindow_VisibleViewControllerTest: XCTestCase {

    var window: UIWindow!

    override func setUp() {
        super.setUp()

        window = UIWindow()
        window.rootViewController = UIViewController()

    }
    
    override func tearDown() {
        window = nil
        
        super.tearDown()
    }
    
    func testVisibleViewController_01() {
        window.rootViewController = UIViewController()
        let viewController = window.visibleViewController
        XCTAssertNotNil(viewController)
    }
    
    func testVisibleViewController_02() {
        let testView = UINavigationController()
        let visibleViewController = UIViewController()
        testView.viewControllers = [visibleViewController]
        let viewController = UIWindow.getVisibleViewControllerFrom(viewController: testView)
        XCTAssertNotNil(viewController)
    }
    
    func testVisibleViewController_03() {
        let testView = UITabBarController()
        let visibleViewController = UIViewController()
        testView.viewControllers = [visibleViewController]
        let viewController = UIWindow.getVisibleViewControllerFrom(viewController: testView)
        XCTAssertNotNil(viewController)
    }

}
