//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease


class GlobalDecentralizedFinanceDefiRequestTest: XCTestCase {

    var request: GlobalDecentralizedFinanceDefiRequest!
    var jsonData: Data!

    override func setUp() {
        super.setUp()
        
        self.request = GlobalDecentralizedFinanceDefiRequest(baseURL: "http://www.test.com")
        
        // The Json to decode
        self.jsonData = """
        {
          "data": {
            "defi_market_cap": "31618934243.5405690110446646687",
            "eth_market_cap": "117767291199.5616556111285461183",
            "defi_to_eth_ratio": "26.8486554470892496724798662551461841130413717033742084376332234",
            "trading_volume_24h": "2902347061.48933334774333473122",
            "defi_dominance": "3.650225652589720752520584333392089991623664559872757575400131",
            "top_coin_name": "Dai",
            "top_coin_defi_dominance": 20.128693589713208
          }
        }
        """.data(using: .utf8)!
        
    }

    override func tearDown() {
        self.request = nil
        self.jsonData = nil
        
        super.tearDown()
        
    }
    
    func testGlobalDecentralizedFinanceDefiRequestTestt_01() {
        XCTAssertTrue(self.request.url == "http://www.test.com/global/decentralized_finance_defi")
        XCTAssertTrue(self.request.headers == [.accept: .applicationJson])
        XCTAssertTrue(self.request.method == .get)
    }
    
    func testGlobalDecentralizedFinanceDefiRequestTest_02() {
        do {
            let dates = try? self.request.decode(self.jsonData)
            XCTAssertNotNil(dates)
        }
    }
}
