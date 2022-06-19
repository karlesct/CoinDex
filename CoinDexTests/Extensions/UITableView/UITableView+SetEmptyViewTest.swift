//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease

class UITableView_SetEmptyViewTest: XCTestCase {

    var tableView: UITableView!

    override func setUp() {
        super.setUp()

        self.tableView = UITableView()
        let action = UIButton.ButtonAction(target: self,
                                           selector: #selector(self.actionTest),
                                           controlEvent: .touchUpInside)
        
        self.tableView.setEmptyView(body: "test",
                                    btTitle: "test",
                                    btAction: action)
    }
    
    override func tearDown() {
        self.tableView = nil
        
        super.tearDown()
    }

    func testUITableView_SetEmptyViewTest_01() {
        
        XCTAssertNotNil(self.tableView.backgroundView)
    }
    
    func testUITableView_SetEmptyViewTest_02() {
        
        self.tableView.restore()
        
        XCTAssertNil(self.tableView.backgroundView)
    }
    
    @objc func actionTest() {
        
    }

}
