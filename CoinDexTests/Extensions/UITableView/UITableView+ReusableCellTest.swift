//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest

class TableView_ReusableCellTest: XCTestCase {

    var tableView: UITableView!

    override func setUp() {
        super.setUp()

        tableView = UITableView()
    }
    
    override func tearDown() {
        tableView = nil
        
        super.tearDown()
    }

    func testReusableCell_01() {

        tableView.register(TestTableViewCell.self)
        let registeredCell = tableView.dequeueReusableCell(TestTableViewCell.self)
        XCTAssertNotNil(registeredCell)
    }
    
    
    func testReusableCell_02() {

        tableView.register(TestHeaderFooterCell.self)
        let registeredCell = tableView.dequeueReusableHeaderFooterView(TestHeaderFooterCell.self)
        XCTAssertNotNil(registeredCell)
    }

    func testReusableCell_03() {

        tableView.register(TestTableViewCell.self)
        let registeredCell = tableView.dequeueReusableCell(TestTableViewCell.self, for: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(registeredCell)
    }

}
