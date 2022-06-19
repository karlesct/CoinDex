//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease


class SimpleSupportedVsCurrenciesRequestTest: XCTestCase {

    var request: SimpleSupportedVsCurrenciesRequest!
    var jsonData: Data!

    override func setUp() {
        super.setUp()
        
        self.request = SimpleSupportedVsCurrenciesRequest(baseURL: "http://www.test.com")
        
        // The Json to decode
        self.jsonData = """
        [
          "btc",
          "eth",
          "ltc",
          "bch",
          "bnb",
          "eos",
          "xrp",
          "xlm",
          "link",
          "dot",
          "yfi",
          "usd",
          "aed",
          "ars",
          "aud",
          "bdt",
          "bhd",
          "bmd",
          "brl",
          "cad",
          "chf",
          "clp",
          "cny",
          "czk",
          "dkk",
          "eur",
          "gbp",
          "hkd",
          "huf",
          "idr",
          "ils",
          "inr",
          "jpy",
          "krw",
          "kwd",
          "lkr",
          "mmk",
          "mxn",
          "myr",
          "ngn",
          "nok",
          "nzd",
          "php",
          "pkr",
          "pln",
          "rub",
          "sar",
          "sek",
          "sgd",
          "thb",
          "try",
          "twd",
          "uah",
          "vef",
          "vnd",
          "zar",
          "xdr",
          "xag",
          "xau",
          "bits",
          "sats"
        ]
        """.data(using: .utf8)!
        
    }

    override func tearDown() {
        self.request = nil
        self.jsonData = nil
        
        super.tearDown()
        
    }
    
    func testPingRequestTest_01() {
        XCTAssertTrue(self.request.url == "http://www.test.com/simple/supported_vs_currencies")
        XCTAssertTrue(self.request.headers == [.accept: .applicationJson])
        XCTAssertTrue(self.request.method == .get)
    }
    
    func testPingRequestTest_02() {
        do {
            let dates = try? self.request.decode(self.jsonData)
            XCTAssertNotNil(dates)
        }
    }
}
