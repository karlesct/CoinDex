//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease


class ExchangeRatesTest: XCTestCase {

    var request: ExchangeRateRequest!
    var jsonData: Data!

    override func setUp() {
        super.setUp()
        
        self.request = ExchangeRateRequest(baseURL: "http://www.test.com")
        
        // The Json to decode
        self.jsonData = """
        {
          "rates": {
            "btc": {
              "name": "Bitcoin",
              "unit": "BTC",
              "value": 1,
              "type": "crypto"
            },
            "eth": {
              "name": "Ether",
              "unit": "ETH",
              "value": 19.373,
              "type": "crypto"
            },
            "ltc": {
              "name": "Litecoin",
              "unit": "LTC",
              "value": 419.674,
              "type": "crypto"
            },
            "bch": {
              "name": "Bitcoin Cash",
              "unit": "BCH",
              "value": 161.474,
              "type": "crypto"
            },
            "bnb": {
              "name": "Binance Coin",
              "unit": "BNB",
              "value": 95.554,
              "type": "crypto"
            },
            "eos": {
              "name": "EOS",
              "unit": "EOS",
              "value": 21314.585,
              "type": "crypto"
            },
            "xrp": {
              "name": "XRP",
              "unit": "XRP",
              "value": 61312.662,
              "type": "crypto"
            },
            "xlm": {
              "name": "Lumens",
              "unit": "XLM",
              "value": 178940.963,
              "type": "crypto"
            },
            "link": {
              "name": "Chainlink",
              "unit": "LINK",
              "value": 3234.174,
              "type": "crypto"
            },
            "dot": {
              "name": "Polkadot",
              "unit": "DOT",
              "value": 2752.386,
              "type": "crypto"
            },
            "yfi": {
              "name": "Yearn.finance",
              "unit": "YFI",
              "value": 4.31,
              "type": "crypto"
            },
            "usd": {
              "name": "US Dollar",
              "unit": "$",
              "value": 18717.462,
              "type": "fiat"
            },
            "aed": {
              "name": "United Arab Emirates Dirham",
              "unit": "DH",
              "value": 68751.11,
              "type": "fiat"
            },
            "ars": {
              "name": "Argentine Peso",
              "unit": "$",
              "value": 2299736.909,
              "type": "fiat"
            },
            "aud": {
              "name": "Australian Dollar",
              "unit": "A$",
              "value": 27005.423,
              "type": "fiat"
            },
            "bdt": {
              "name": "Bangladeshi Taka",
              "unit": "৳",
              "value": 1743317.766,
              "type": "fiat"
            },
            "bhd": {
              "name": "Bahraini Dinar",
              "unit": "BD",
              "value": 7056.258,
              "type": "fiat"
            },
            "bmd": {
              "name": "Bermudian Dollar",
              "unit": "$",
              "value": 18717.462,
              "type": "fiat"
            },
            "brl": {
              "name": "Brazil Real",
              "unit": "R$",
              "value": 96463.435,
              "type": "fiat"
            },
            "cad": {
              "name": "Canadian Dollar",
              "unit": "CA$",
              "value": 24383.331,
              "type": "fiat"
            },
            "chf": {
              "name": "Swiss Franc",
              "unit": "Fr.",
              "value": 18171.81,
              "type": "fiat"
            },
            "clp": {
              "name": "Chilean Peso",
              "unit": "CLP$",
              "value": 16262837.834,
              "type": "fiat"
            },
            "cny": {
              "name": "Chinese Yuan",
              "unit": "¥",
              "value": 125719.577,
              "type": "fiat"
            },
            "czk": {
              "name": "Czech Koruna",
              "unit": "Kč",
              "value": 440897.306,
              "type": "fiat"
            },
            "dkk": {
              "name": "Danish Krone",
              "unit": "kr.",
              "value": 132666.095,
              "type": "fiat"
            },
            "eur": {
              "name": "Euro",
              "unit": "€",
              "value": 17832.949,
              "type": "fiat"
            },
            "gbp": {
              "name": "British Pound Sterling",
              "unit": "£",
              "value": 15310.172,
              "type": "fiat"
            },
            "hkd": {
              "name": "Hong Kong Dollar",
              "unit": "HK$",
              "value": 146930.299,
              "type": "fiat"
            },
            "huf": {
              "name": "Hungarian Forint",
              "unit": "Ft",
              "value": 7131025.503,
              "type": "fiat"
            },
            "idr": {
              "name": "Indonesian Rupiah",
              "unit": "Rp",
              "value": 277745612.457,
              "type": "fiat"
            },
            "ils": {
              "name": "Israeli New Shekel",
              "unit": "₪",
              "value": 64800.134,
              "type": "fiat"
            },
            "inr": {
              "name": "Indian Rupee",
              "unit": "₹",
              "value": 1459243.293,
              "type": "fiat"
            },
            "jpy": {
              "name": "Japanese Yen",
              "unit": "¥",
              "value": 2526717.002,
              "type": "fiat"
            },
            "krw": {
              "name": "South Korean Won",
              "unit": "₩",
              "value": 24173602.299,
              "type": "fiat"
            },
            "kwd": {
              "name": "Kuwaiti Dinar",
              "unit": "KD",
              "value": 5747.87,
              "type": "fiat"
            },
            "lkr": {
              "name": "Sri Lankan Rupee",
              "unit": "Rs",
              "value": 6733200.839,
              "type": "fiat"
            },
            "mmk": {
              "name": "Burmese Kyat",
              "unit": "K",
              "value": 34725621.308,
              "type": "fiat"
            },
            "mxn": {
              "name": "Mexican Peso",
              "unit": "MX$",
              "value": 380693.525,
              "type": "fiat"
            },
            "myr": {
              "name": "Malaysian Ringgit",
              "unit": "RM",
              "value": 82394.268,
              "type": "fiat"
            },
            "ngn": {
              "name": "Nigerian Naira",
              "unit": "₦",
              "value": 7783466.144,
              "type": "fiat"
            },
            "nok": {
              "name": "Norwegian Krone",
              "unit": "kr",
              "value": 187180.236,
              "type": "fiat"
            },
            "nzd": {
              "name": "New Zealand Dollar",
              "unit": "NZ$",
              "value": 29634.852,
              "type": "fiat"
            },
            "php": {
              "name": "Philippine Peso",
              "unit": "₱",
              "value": 1006250.762,
              "type": "fiat"
            },
            "pkr": {
              "name": "Pakistani Rupee",
              "unit": "₨",
              "value": 3924576.621,
              "type": "fiat"
            },
            "pln": {
              "name": "Polish Zloty",
              "unit": "zł",
              "value": 83436.83,
              "type": "fiat"
            },
            "rub": {
              "name": "Russian Ruble",
              "unit": "₽",
              "value": 1076252.236,
              "type": "fiat"
            },
            "sar": {
              "name": "Saudi Riyal",
              "unit": "SR",
              "value": 70215.788,
              "type": "fiat"
            },
            "sek": {
              "name": "Swedish Krona",
              "unit": "kr",
              "value": 190543.764,
              "type": "fiat"
            },
            "sgd": {
              "name": "Singapore Dollar",
              "unit": "S$",
              "value": 26028.502,
              "type": "fiat"
            },
            "thb": {
              "name": "Thai Baht",
              "unit": "฿",
              "value": 659523.553,
              "type": "fiat"
            },
            "try": {
              "name": "Turkish Lira",
              "unit": "₺",
              "value": 324343.67,
              "type": "fiat"
            },
            "twd": {
              "name": "New Taiwan Dollar",
              "unit": "NT$",
              "value": 556217.462,
              "type": "fiat"
            },
            "uah": {
              "name": "Ukrainian hryvnia",
              "unit": "₴",
              "value": 554105.702,
              "type": "fiat"
            },
            "vef": {
              "name": "Venezuelan bolívar fuerte",
              "unit": "Bs.F",
              "value": 1874.179,
              "type": "fiat"
            },
            "vnd": {
              "name": "Vietnamese đồng",
              "unit": "₫",
              "value": 434784346.992,
              "type": "fiat"
            },
            "zar": {
              "name": "South African Rand",
              "unit": "R",
              "value": 300006.477,
              "type": "fiat"
            },
            "xdr": {
              "name": "IMF Special Drawing Rights",
              "unit": "XDR",
              "value": 13714.939,
              "type": "fiat"
            },
            "xag": {
              "name": "Silver - Troy Ounce",
              "unit": "XAG",
              "value": 863.372,
              "type": "commodity"
            },
            "xau": {
              "name": "Gold - Troy Ounce",
              "unit": "XAU",
              "value": 10.171,
              "type": "commodity"
            },
            "bits": {
              "name": "Bits",
              "unit": "μBTC",
              "value": 1000000,
              "type": "crypto"
            },
            "sats": {
              "name": "Satoshi",
              "unit": "sats",
              "value": 100000000,
              "type": "crypto"
            }
          }
        }
        """.data(using: .utf8)!
        
    }

    override func tearDown() {
        self.request = nil
        self.jsonData = nil
        
        super.tearDown()
        
    }
    
    func testExchangeRatesTest_01() {
        XCTAssertTrue(self.request.url == "http://www.test.com/exchange_rates")
        XCTAssertTrue(self.request.headers == [.accept: .applicationJson])
        XCTAssertTrue(self.request.method == .get)
    }
    
    func testExchangeRatesTest_02() {
        do {
            let dates = try? self.request.decode(self.jsonData)
            XCTAssertNotNil(dates)
        }
    }
}
