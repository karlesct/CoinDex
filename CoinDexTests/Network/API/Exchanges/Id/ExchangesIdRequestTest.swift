//
//  Copyright © 2022 CCT. All rights reserved.
//


import XCTest
@testable import CoinDexRelease

class ExchangesIdRequestTest: XCTestCase {

    var request: ExchangesIdRequest!
    var jsonData: Data!

    override func setUp() {
        super.setUp()
        
        self.request = ExchangesIdRequest(baseURL: "http://www.test.com", id: "binance")
        
        // The Json to decode
        self.jsonData = """
        {
          "name": "Binance",
          "year_established": 2017,
          "country": "Cayman Islands",
          "description": "",
          "url": "https://www.binance.com/",
          "image": "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250",
          "facebook_url": "https://www.facebook.com/binanceexchange",
          "reddit_url": "https://www.reddit.com/r/binance/",
          "telegram_url": "",
          "slack_url": "",
          "other_url_1": "https://medium.com/binanceexchange",
          "other_url_2": "https://steemit.com/@binanceexchange",
          "twitter_handle": "binance",
          "has_trading_incentive": false,
          "centralized": true,
          "public_notice": "",
          "alert_notice": "",
          "trust_score": 10,
          "trust_score_rank": 1,
          "trade_volume_24h_btc": 845603.7071357679,
          "trade_volume_24h_btc_normalized": 845603.7071357679,
          "tickers": [
            {
              "base": "BUSD",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 1.0014,
              "volume": 1039351298.7766128,
              "converted_last": {
                "btc": 0.00005097,
                "eth": 0.00094562,
                "usd": 1.006
              },
              "converted_volume": {
                "btc": 52979,
                "eth": 982836,
                "usd": 1045991935
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.019986,
              "timestamp": "2022-06-19T16:19:53+00:00",
              "last_traded_at": "2022-06-19T16:19:53+00:00",
              "last_fetch_at": "2022-06-19T16:19:53+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/BUSD_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "binance-usd",
              "target_coin_id": "tether"
            },
            {
              "base": "USDC",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 1.0013,
              "volume": 553912088.1330271,
              "converted_last": {
                "btc": 0.000051,
                "eth": 0.00094464,
                "usd": 1.002
              },
              "converted_volume": {
                "btc": 28250,
                "eth": 523246,
                "usd": 554963404
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.019986,
              "timestamp": "2022-06-19T16:31:53+00:00",
              "last_traded_at": "2022-06-19T16:31:53+00:00",
              "last_fetch_at": "2022-06-19T16:31:53+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/USDC_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "usd-coin",
              "target_coin_id": "tether"
            },
            {
              "base": "BTC",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 19661.27,
              "volume": 176852.7969008813,
              "converted_last": {
                "btc": 1.001037,
                "eth": 18.570528,
                "usd": 19745.43
              },
              "converted_volume": {
                "btc": 177036,
                "eth": 3284250,
                "usd": 3492034376
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.010051,
              "timestamp": "2022-06-19T16:22:48+00:00",
              "last_traded_at": "2022-06-19T16:22:48+00:00",
              "last_fetch_at": "2022-06-19T16:22:48+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/BTC_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "bitcoin",
              "target_coin_id": "tether"
            },
            {
              "base": "ETH",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 1059.93,
              "volume": 2384934.0439552353,
              "converted_last": {
                "btc": 0.05401292,
                "eth": 1.000553,
                "usd": 1061.44
              },
              "converted_volume": {
                "btc": 128817,
                "eth": 2386253,
                "usd": 2531467408
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.010975,
              "timestamp": "2022-06-19T16:26:56+00:00",
              "last_traded_at": "2022-06-19T16:26:56+00:00",
              "last_fetch_at": "2022-06-19T16:26:56+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/ETH_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "ethereum",
              "target_coin_id": "tether"
            },
            {
              "base": "BTC",
              "target": "BUSD",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 19583.5,
              "volume": 65090.14152039908,
              "converted_last": {
                "btc": 0.99925503,
                "eth": 18.508195,
                "usd": 19636.44
              },
              "converted_volume": {
                "btc": 65042,
                "eth": 1204701,
                "usd": 1278138577
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.010051,
              "timestamp": "2022-06-19T16:32:50+00:00",
              "last_traded_at": "2022-06-19T16:32:50+00:00",
              "last_fetch_at": "2022-06-19T16:32:50+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/BTC_BUSD?ref=37754157",
              "token_info_url": null,
              "coin_id": "bitcoin",
              "target_coin_id": "binance-usd"
            },
            {
              "base": "WBTC",
              "target": "BTC",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.9995,
              "volume": 779.5961876238119,
              "converted_last": {
                "btc": 0.9995,
                "eth": 18.512501,
                "usd": 19632.2
              },
              "converted_volume": {
                "btc": 779.206,
                "eth": 14432,
                "usd": 15305185
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.02001,
              "timestamp": "2022-06-19T16:32:56+00:00",
              "last_traded_at": "2022-06-19T16:32:56+00:00",
              "last_fetch_at": "2022-06-19T16:35:01+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/WBTC_BTC?ref=37754157",
              "token_info_url": null,
              "coin_id": "wrapped-bitcoin",
              "target_coin_id": "bitcoin"
            },
            {
              "base": "ETH",
              "target": "BUSD",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 1055.43,
              "volume": 697613.8669663237,
              "converted_last": {
                "btc": 0.05389384,
                "eth": 0.9989106,
                "usd": 1058.1
              },
              "converted_volume": {
                "btc": 37597,
                "eth": 696854,
                "usd": 738147564
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.010969,
              "timestamp": "2022-06-19T16:37:04+00:00",
              "last_traded_at": "2022-06-19T16:37:04+00:00",
              "last_fetch_at": "2022-06-19T16:37:04+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/ETH_BUSD?ref=37754157",
              "token_info_url": null,
              "coin_id": "ethereum",
              "target_coin_id": "binance-usd"
            },
            {
              "base": "ETH",
              "target": "BTC",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.054076,
              "volume": 297102.35801908426,
              "converted_last": {
                "btc": 0.054076,
                "eth": 1.002287,
                "usd": 1061.46
              },
              "converted_volume": {
                "btc": 16066,
                "eth": 297782,
                "usd": 315360797
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.01185,
              "timestamp": "2022-06-19T16:38:51+00:00",
              "last_traded_at": "2022-06-19T16:38:51+00:00",
              "last_fetch_at": "2022-06-19T16:38:51+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/ETH_BTC?ref=37754157",
              "token_info_url": null,
              "coin_id": "ethereum",
              "target_coin_id": "bitcoin"
            },
            {
              "base": "BNB",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 206.3,
              "volume": 1443214.2104681134,
              "converted_last": {
                "btc": 0.0105243,
                "eth": 0.19506555,
                "usd": 206.62
              },
              "converted_volume": {
                "btc": 15189,
                "eth": 281521,
                "usd": 298203573
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.048379,
              "timestamp": "2022-06-19T16:37:05+00:00",
              "last_traded_at": "2022-06-19T16:37:05+00:00",
              "last_fetch_at": "2022-06-19T16:37:05+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/BNB_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "binancecoin",
              "target_coin_id": "tether"
            },
            {
              "base": "SOL",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 32.89,
              "volume": 10284866.791961083,
              "converted_last": {
                "btc": 0.00168029,
                "eth": 0.03115845,
                "usd": 33.03
              },
              "converted_volume": {
                "btc": 17282,
                "eth": 320461,
                "usd": 339665142
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.031319,
              "timestamp": "2022-06-19T16:24:02+00:00",
              "last_traded_at": "2022-06-19T16:24:02+00:00",
              "last_fetch_at": "2022-06-19T16:24:02+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/SOL_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "solana",
              "target_coin_id": "tether"
            },
            {
              "base": "XRP",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.3157,
              "volume": 488165571.32968324,
              "converted_last": {
                "btc": 0.00001612,
                "eth": 0.00029869,
                "usd": 0.316317
              },
              "converted_volume": {
                "btc": 7867,
                "eth": 145811,
                "usd": 154415124
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.031696,
              "timestamp": "2022-06-19T16:39:42+00:00",
              "last_traded_at": "2022-06-19T16:39:42+00:00",
              "last_fetch_at": "2022-06-19T16:39:42+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/XRP_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "ripple",
              "target_coin_id": "tether"
            },
            {
              "base": "ADA",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.4661,
              "volume": 380680714.9136666,
              "converted_last": {
                "btc": 0.00002381,
                "eth": 0.00044156,
                "usd": 0.468023
              },
              "converted_volume": {
                "btc": 9065,
                "eth": 168094,
                "usd": 178167471
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.0214,
              "timestamp": "2022-06-19T16:24:49+00:00",
              "last_traded_at": "2022-06-19T16:24:49+00:00",
              "last_fetch_at": "2022-06-19T16:24:49+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/ADA_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "cardano",
              "target_coin_id": "tether"
            },
            {
              "base": "USDT",
              "target": "TRY",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 17.486,
              "volume": 40034730.88619467,
              "converted_last": {
                "btc": 0.00005137,
                "eth": 0.00095142,
                "usd": 1.009
              },
              "converted_volume": {
                "btc": 2056,
                "eth": 38090,
                "usd": 40398843
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.015717,
              "timestamp": "2022-06-19T16:31:52+00:00",
              "last_traded_at": "2022-06-19T16:31:52+00:00",
              "last_fetch_at": "2022-06-19T16:31:52+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/USDT_TRY?ref=37754157",
              "token_info_url": null,
              "coin_id": "tether"
            },
            {
              "base": "BTC",
              "target": "USDC",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 19530.7,
              "volume": 12824.597822020967,
              "converted_last": {
                "btc": 0.99849745,
                "eth": 18.506933,
                "usd": 19603.6
              },
              "converted_volume": {
                "btc": 12805,
                "eth": 237344,
                "usd": 251408339
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.013723,
              "timestamp": "2022-06-19T16:37:56+00:00",
              "last_traded_at": "2022-06-19T16:37:56+00:00",
              "last_fetch_at": "2022-06-19T16:37:56+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/BTC_USDC?ref=37754157",
              "token_info_url": null,
              "coin_id": "bitcoin",
              "target_coin_id": "usd-coin"
            },
            {
              "base": "BNB",
              "target": "BUSD",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 206.6,
              "volume": 689008.9069350726,
              "converted_last": {
                "btc": 0.0105497,
                "eth": 0.19539914,
                "usd": 207.31
              },
              "converted_volume": {
                "btc": 7269,
                "eth": 134632,
                "usd": 142837732
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.048379,
              "timestamp": "2022-06-19T16:33:53+00:00",
              "last_traded_at": "2022-06-19T16:33:53+00:00",
              "last_fetch_at": "2022-06-19T16:33:53+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/BNB_BUSD?ref=37754157",
              "token_info_url": null,
              "coin_id": "binancecoin",
              "target_coin_id": "binance-usd"
            },
            {
              "base": "USDP",
              "target": "BUSD",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 1,
              "volume": 1185888.17465,
              "converted_last": {
                "btc": 0.0000511,
                "eth": 0.0009463,
                "usd": 1.004
              },
              "converted_volume": {
                "btc": 60.6,
                "eth": 1122,
                "usd": 1190432
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.02,
              "timestamp": "2022-06-19T16:30:15+00:00",
              "last_traded_at": "2022-06-19T16:30:15+00:00",
              "last_fetch_at": "2022-06-19T16:30:15+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/USDP_BUSD?ref=37754157",
              "token_info_url": null,
              "coin_id": "paxos-standard",
              "target_coin_id": "binance-usd"
            },
            {
              "base": "BUSD",
              "target": "TRY",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 17.514,
              "volume": 22626777.788797535,
              "converted_last": {
                "btc": 0.00005146,
                "eth": 0.00095307,
                "usd": 1.011
              },
              "converted_volume": {
                "btc": 1164,
                "eth": 21565,
                "usd": 22869127
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.015701,
              "timestamp": "2022-06-19T16:35:56+00:00",
              "last_traded_at": "2022-06-19T16:35:56+00:00",
              "last_fetch_at": "2022-06-19T16:35:56+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/BUSD_TRY?ref=37754157",
              "token_info_url": null,
              "coin_id": "binance-usd"
            },
            {
              "base": "TUSD",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 1.0014,
              "volume": 20332854.231076494,
              "converted_last": {
                "btc": 0.00005109,
                "eth": 0.0009462,
                "usd": 1.004
              },
              "converted_volume": {
                "btc": 1039,
                "eth": 19239,
                "usd": 20404284
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.019986,
              "timestamp": "2022-06-19T16:34:57+00:00",
              "last_traded_at": "2022-06-19T16:34:57+00:00",
              "last_fetch_at": "2022-06-19T16:34:57+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/TUSD_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "true-usd",
              "target_coin_id": "tether"
            },
            {
              "base": "AVAX",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 15.25,
              "volume": 6014770.471239344,
              "converted_last": {
                "btc": 0.00077675,
                "eth": 0.01438701,
                "usd": 15.26
              },
              "converted_volume": {
                "btc": 4672,
                "eth": 86535,
                "usd": 91809617
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.066622,
              "timestamp": "2022-06-19T16:32:00+00:00",
              "last_traded_at": "2022-06-19T16:32:00+00:00",
              "last_fetch_at": "2022-06-19T16:32:00+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/AVAX_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "avalanche-2",
              "target_coin_id": "tether"
            },
            {
              "base": "DOGE",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.05797,
              "volume": 2278237645.329136,
              "converted_last": {
                "btc": 0.00000296,
                "eth": 0.00005494,
                "usd": 0.058205
              },
              "converted_volume": {
                "btc": 6747,
                "eth": 125169,
                "usd": 132604522
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.017232,
              "timestamp": "2022-06-19T16:23:52+00:00",
              "last_traded_at": "2022-06-19T16:23:52+00:00",
              "last_fetch_at": "2022-06-19T16:23:52+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/DOGE_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "dogecoin",
              "target_coin_id": "tether"
            },
            {
              "base": "SOL",
              "target": "BUSD",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 32.54,
              "volume": 4200219.218638599,
              "converted_last": {
                "btc": 0.0016616,
                "eth": 0.03079745,
                "usd": 32.62
              },
              "converted_volume": {
                "btc": 6979,
                "eth": 129356,
                "usd": 137021323
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.030722,
              "timestamp": "2022-06-19T16:37:58+00:00",
              "last_traded_at": "2022-06-19T16:37:58+00:00",
              "last_fetch_at": "2022-06-19T16:37:58+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/SOL_BUSD?ref=37754157",
              "token_info_url": null,
              "coin_id": "solana",
              "target_coin_id": "binance-usd"
            },
            {
              "base": "USDP",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 1.0014,
              "volume": 2240297.0902806073,
              "converted_last": {
                "btc": 0.00005112,
                "eth": 0.00094745,
                "usd": 1.003
              },
              "converted_volume": {
                "btc": 114.522,
                "eth": 2123,
                "usd": 2247789
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.019986,
              "timestamp": "2022-06-19T16:40:12+00:00",
              "last_traded_at": "2022-06-19T16:40:12+00:00",
              "last_fetch_at": "2022-06-19T16:40:12+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/USDP_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "paxos-standard",
              "target_coin_id": "tether"
            },
            {
              "base": "BETH",
              "target": "ETH",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.9501,
              "volume": 18300.834875128934,
              "converted_last": {
                "btc": 0.05139091,
                "eth": 0.9528894,
                "usd": 1016.53
              },
              "converted_volume": {
                "btc": 940.497,
                "eth": 17439,
                "usd": 18603310
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.010527,
              "timestamp": "2022-06-19T16:12:00+00:00",
              "last_traded_at": "2022-06-19T16:12:00+00:00",
              "last_fetch_at": "2022-06-19T16:12:00+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/BETH_ETH?ref=37754157",
              "token_info_url": null,
              "coin_id": "binance-eth",
              "target_coin_id": "ethereum"
            },
            {
              "base": "TUSD",
              "target": "BUSD",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 1,
              "volume": 2677553.86409,
              "converted_last": {
                "btc": 0.00005106,
                "eth": 0.00094578,
                "usd": 1.003
              },
              "converted_volume": {
                "btc": 136.725,
                "eth": 2532,
                "usd": 2686742
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.019999,
              "timestamp": "2022-06-19T16:33:03+00:00",
              "last_traded_at": "2022-06-19T16:33:03+00:00",
              "last_fetch_at": "2022-06-19T16:33:03+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/TUSD_BUSD?ref=37754157",
              "token_info_url": null,
              "coin_id": "true-usd",
              "target_coin_id": "binance-usd"
            },
            {
              "base": "ETH",
              "target": "USDC",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 1057.57,
              "volume": 101508.25026416218,
              "converted_last": {
                "btc": 0.05387903,
                "eth": 0.99775025,
                "usd": 1058.29
              },
              "converted_volume": {
                "btc": 5469,
                "eth": 101280,
                "usd": 107424820
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.030221,
              "timestamp": "2022-06-19T16:29:48+00:00",
              "last_traded_at": "2022-06-19T16:29:48+00:00",
              "last_fetch_at": "2022-06-19T16:29:48+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/ETH_USDC?ref=37754157",
              "token_info_url": null,
              "coin_id": "ethereum",
              "target_coin_id": "usd-coin"
            },
            {
              "base": "BNB",
              "target": "BTC",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.010554,
              "volume": 180370.4441406102,
              "converted_last": {
                "btc": 0.010554,
                "eth": 0.19547883,
                "usd": 207.32
              },
              "converted_volume": {
                "btc": 1904,
                "eth": 35259,
                "usd": 37394182
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.019474,
              "timestamp": "2022-06-19T16:34:49+00:00",
              "last_traded_at": "2022-06-19T16:34:49+00:00",
              "last_fetch_at": "2022-06-19T16:34:49+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/BNB_BTC?ref=37754157",
              "token_info_url": null,
              "coin_id": "binancecoin",
              "target_coin_id": "bitcoin"
            },
            {
              "base": "TRX",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.05924,
              "volume": 2154237760.9036293,
              "converted_last": {
                "btc": 0.00000302,
                "eth": 0.00005605,
                "usd": 0.059356
              },
              "converted_volume": {
                "btc": 6515,
                "eth": 120742,
                "usd": 127866503
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.050268,
              "timestamp": "2022-06-19T16:39:43+00:00",
              "last_traded_at": "2022-06-19T16:39:43+00:00",
              "last_fetch_at": "2022-06-19T16:39:43+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/TRX_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "tron",
              "target_coin_id": "tether"
            },
            {
              "base": "LTC",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 51.58,
              "volume": 2279568.289064366,
              "converted_last": {
                "btc": 0.00263112,
                "eth": 0.04872405,
                "usd": 51.69
              },
              "converted_volume": {
                "btc": 5998,
                "eth": 111070,
                "usd": 117822364
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.019376,
              "timestamp": "2022-06-19T16:30:48+00:00",
              "last_traded_at": "2022-06-19T16:30:48+00:00",
              "last_fetch_at": "2022-06-19T16:30:48+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/LTC_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "litecoin",
              "target_coin_id": "tether"
            },
            {
              "base": "FTM",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.2307,
              "volume": 249208107.88773298,
              "converted_last": {
                "btc": 0.00001177,
                "eth": 0.00021798,
                "usd": 0.231168
              },
              "converted_volume": {
                "btc": 2933,
                "eth": 54323,
                "usd": 57608915
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.042974,
              "timestamp": "2022-06-19T16:35:51+00:00",
              "last_traded_at": "2022-06-19T16:35:51+00:00",
              "last_fetch_at": "2022-06-19T16:35:51+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/FTM_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "fantom",
              "target_coin_id": "tether"
            },
            {
              "base": "USDT",
              "target": "DAI",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.9987,
              "volume": 13701084.902713528,
              "converted_last": {
                "btc": 0.00005096,
                "eth": 0.00094392,
                "usd": 1.001
              },
              "converted_volume": {
                "btc": 698.234,
                "eth": 12933,
                "usd": 13721054
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.010013,
              "timestamp": "2022-06-19T16:32:54+00:00",
              "last_traded_at": "2022-06-19T16:32:54+00:00",
              "last_fetch_at": "2022-06-19T16:32:54+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/USDT_DAI?ref=37754157",
              "token_info_url": null,
              "coin_id": "tether",
              "target_coin_id": "dai"
            },
            {
              "base": "GMT",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.63831,
              "volume": 125945160.23394902,
              "converted_last": {
                "btc": 0.00003258,
                "eth": 0.00060394,
                "usd": 0.639597
              },
              "converted_volume": {
                "btc": 4104,
                "eth": 76064,
                "usd": 80554112
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.011564,
              "timestamp": "2022-06-19T16:38:25+00:00",
              "last_traded_at": "2022-06-19T16:38:25+00:00",
              "last_fetch_at": "2022-06-19T16:38:25+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/GMT_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "stepn",
              "target_coin_id": "tether"
            },
            {
              "base": "USDT",
              "target": "BRL",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 5.186,
              "volume": 9184242.291920556,
              "converted_last": {
                "btc": 0.000051,
                "eth": 0.00094585,
                "usd": 1.006
              },
              "converted_volume": {
                "btc": 468.357,
                "eth": 8687,
                "usd": 9241875
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.019301,
              "timestamp": "2022-06-19T16:20:03+00:00",
              "last_traded_at": "2022-06-19T16:20:03+00:00",
              "last_fetch_at": "2022-06-19T16:20:03+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/USDT_BRL?ref=37754157",
              "token_info_url": null,
              "coin_id": "tether"
            },
            {
              "base": "BTC",
              "target": "EUR",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 18746.64,
              "volume": 6155.142505120867,
              "converted_last": {
                "btc": 1.001395,
                "eth": 18.550183,
                "usd": 19676.47
              },
              "converted_volume": {
                "btc": 6164,
                "eth": 114179,
                "usd": 121111485
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.010728,
              "timestamp": "2022-06-19T16:27:52+00:00",
              "last_traded_at": "2022-06-19T16:27:52+00:00",
              "last_fetch_at": "2022-06-19T16:27:52+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/BTC_EUR?ref=37754157",
              "token_info_url": null,
              "coin_id": "bitcoin"
            },
            {
              "base": "APE",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 3.9055,
              "volume": 25303081.9302202,
              "converted_last": {
                "btc": 0.00019937,
                "eth": 0.0036951,
                "usd": 3.91
              },
              "converted_volume": {
                "btc": 5045,
                "eth": 93497,
                "usd": 99014356
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.03839,
              "timestamp": "2022-06-19T16:39:10+00:00",
              "last_traded_at": "2022-06-19T16:39:10+00:00",
              "last_fetch_at": "2022-06-19T16:39:10+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/APE_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "apecoin",
              "target_coin_id": "tether"
            },
            {
              "base": "SAND",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.8143,
              "volume": 53369155.32764337,
              "converted_last": {
                "btc": 0.00004157,
                "eth": 0.00077043,
                "usd": 0.815892
              },
              "converted_volume": {
                "btc": 2218,
                "eth": 41117,
                "usd": 43543453
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.012288,
              "timestamp": "2022-06-19T16:40:00+00:00",
              "last_traded_at": "2022-06-19T16:40:00+00:00",
              "last_fetch_at": "2022-06-19T16:40:00+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/SAND_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "the-sandbox",
              "target_coin_id": "tether"
            },
            {
              "base": "ADA",
              "target": "BUSD",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.4652,
              "volume": 136241474.39034823,
              "converted_last": {
                "btc": 0.00002375,
                "eth": 0.00044027,
                "usd": 0.466251
              },
              "converted_volume": {
                "btc": 3236,
                "eth": 59983,
                "usd": 63522751
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.021505,
              "timestamp": "2022-06-19T16:39:51+00:00",
              "last_traded_at": "2022-06-19T16:39:51+00:00",
              "last_fetch_at": "2022-06-19T16:39:51+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/ADA_BUSD?ref=37754157",
              "token_info_url": null,
              "coin_id": "cardano",
              "target_coin_id": "binance-usd"
            },
            {
              "base": "LINK",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 6.37,
              "volume": 12291860.696483517,
              "converted_last": {
                "btc": 0.00032494,
                "eth": 0.0060173,
                "usd": 6.38
              },
              "converted_volume": {
                "btc": 3994,
                "eth": 73964,
                "usd": 78451367
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.15674,
              "timestamp": "2022-06-19T16:29:45+00:00",
              "last_traded_at": "2022-06-19T16:29:45+00:00",
              "last_fetch_at": "2022-06-19T16:29:45+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/LINK_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "chainlink",
              "target_coin_id": "tether"
            },
            {
              "base": "USDT",
              "target": "BIDR",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 14842,
              "volume": 4695514.1883102,
              "converted_last": {
                "btc": 0.00005101,
                "eth": 0.00094476,
                "usd": 1.002
              },
              "converted_volume": {
                "btc": 239.51,
                "eth": 4436,
                "usd": 4704847
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.016737,
              "timestamp": "2022-06-19T16:34:57+00:00",
              "last_traded_at": "2022-06-19T16:34:57+00:00",
              "last_fetch_at": "2022-06-19T16:34:57+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/USDT_BIDR?ref=37754157",
              "token_info_url": null,
              "coin_id": "tether",
              "target_coin_id": "binanceidr"
            },
            {
              "base": "BUSD",
              "target": "DAI",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 1,
              "volume": 4876516.10167,
              "converted_last": {
                "btc": 0.00005111,
                "eth": 0.00094715,
                "usd": 1.004
              },
              "converted_volume": {
                "btc": 249.26,
                "eth": 4619,
                "usd": 4894809
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.019996,
              "timestamp": "2022-06-19T16:36:06+00:00",
              "last_traded_at": "2022-06-19T16:36:06+00:00",
              "last_fetch_at": "2022-06-19T16:36:06+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/BUSD_DAI?ref=37754157",
              "token_info_url": null,
              "coin_id": "binance-usd",
              "target_coin_id": "dai"
            },
            {
              "base": "FTT",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 23.8,
              "volume": 510209.0057394958,
              "converted_last": {
                "btc": 0.00121494,
                "eth": 0.02251784,
                "usd": 23.85
              },
              "converted_volume": {
                "btc": 619.873,
                "eth": 11489,
                "usd": 12166711
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.042052,
              "timestamp": "2022-06-19T16:39:52+00:00",
              "last_traded_at": "2022-06-19T16:39:52+00:00",
              "last_fetch_at": "2022-06-19T16:39:52+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/FTT_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "ftx-token",
              "target_coin_id": "tether"
            },
            {
              "base": "DOT",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 7.28,
              "volume": 9425743.06353022,
              "converted_last": {
                "btc": 0.00037066,
                "eth": 0.00687613,
                "usd": 7.31
              },
              "converted_volume": {
                "btc": 3494,
                "eth": 64813,
                "usd": 68913132
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.137363,
              "timestamp": "2022-06-19T16:22:01+00:00",
              "last_traded_at": "2022-06-19T16:22:01+00:00",
              "last_fetch_at": "2022-06-19T16:22:01+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/DOT_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "polkadot",
              "target_coin_id": "tether"
            },
            {
              "base": "MANA",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.7945,
              "volume": 44942373.9778477,
              "converted_last": {
                "btc": 0.00004056,
                "eth": 0.0007517,
                "usd": 0.796053
              },
              "converted_volume": {
                "btc": 1823,
                "eth": 33783,
                "usd": 35776514
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.012596,
              "timestamp": "2022-06-19T16:39:58+00:00",
              "last_traded_at": "2022-06-19T16:39:58+00:00",
              "last_fetch_at": "2022-06-19T16:39:58+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/MANA_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "decentraland",
              "target_coin_id": "tether"
            },
            {
              "base": "NEAR",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 3.171,
              "volume": 16472676.931882687,
              "converted_last": {
                "btc": 0.00016187,
                "eth": 0.00300028,
                "usd": 3.18
              },
              "converted_volume": {
                "btc": 2666,
                "eth": 49423,
                "usd": 52340155
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.031566,
              "timestamp": "2022-06-19T16:38:04+00:00",
              "last_traded_at": "2022-06-19T16:38:04+00:00",
              "last_fetch_at": "2022-06-19T16:38:04+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/NEAR_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "near",
              "target_coin_id": "tether"
            },
            {
              "base": "BUSD",
              "target": "BRL",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 5.193,
              "volume": 5447477.901887156,
              "converted_last": {
                "btc": 0.0000513,
                "eth": 0.00095016,
                "usd": 1.008
              },
              "converted_volume": {
                "btc": 279.455,
                "eth": 5176,
                "usd": 5489061
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.019275,
              "timestamp": "2022-06-19T16:35:07+00:00",
              "last_traded_at": "2022-06-19T16:35:07+00:00",
              "last_fetch_at": "2022-06-19T16:35:07+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/BUSD_BRL?ref=37754157",
              "token_info_url": null,
              "coin_id": "binance-usd"
            },
            {
              "base": "XRP",
              "target": "BUSD",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.3148,
              "volume": 99531483.77731894,
              "converted_last": {
                "btc": 0.00001607,
                "eth": 0.00029794,
                "usd": 0.315597
              },
              "converted_volume": {
                "btc": 1600,
                "eth": 29655,
                "usd": 31411875
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.031616,
              "timestamp": "2022-06-19T16:37:56+00:00",
              "last_traded_at": "2022-06-19T16:37:56+00:00",
              "last_fetch_at": "2022-06-19T16:37:56+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/XRP_BUSD?ref=37754157",
              "token_info_url": null,
              "coin_id": "ripple",
              "target_coin_id": "binance-usd"
            },
            {
              "base": "BCH",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 120.4,
              "volume": 190309.22726245847,
              "converted_last": {
                "btc": 0.00613546,
                "eth": 0.11365525,
                "usd": 120.56
              },
              "converted_volume": {
                "btc": 1168,
                "eth": 21630,
                "usd": 22942903
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.083472,
              "timestamp": "2022-06-19T16:27:51+00:00",
              "last_traded_at": "2022-06-19T16:27:51+00:00",
              "last_fetch_at": "2022-06-19T16:27:51+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/BCH_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "bitcoin-cash",
              "target_coin_id": "tether"
            },
            {
              "base": "AVAX",
              "target": "BUSD",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 15.21,
              "volume": 2562927.5376890204,
              "converted_last": {
                "btc": 0.00077724,
                "eth": 0.01439323,
                "usd": 15.27
              },
              "converted_volume": {
                "btc": 1992,
                "eth": 36889,
                "usd": 39126967
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.065746,
              "timestamp": "2022-06-19T16:29:59+00:00",
              "last_traded_at": "2022-06-19T16:29:59+00:00",
              "last_fetch_at": "2022-06-19T16:29:59+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/AVAX_BUSD?ref=37754157",
              "token_info_url": null,
              "coin_id": "avalanche-2",
              "target_coin_id": "binance-usd"
            },
            {
              "base": "MATIC",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.36,
              "volume": 144975169.86103332,
              "converted_last": {
                "btc": 0.00001834,
                "eth": 0.00033963,
                "usd": 0.360215
              },
              "converted_volume": {
                "btc": 2658,
                "eth": 49238,
                "usd": 52222230
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.277008,
              "timestamp": "2022-06-19T16:31:52+00:00",
              "last_traded_at": "2022-06-19T16:31:52+00:00",
              "last_fetch_at": "2022-06-19T16:31:52+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/MATIC_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "matic-network",
              "target_coin_id": "tether"
            },
            {
              "base": "AXS",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 13.24,
              "volume": 1298924.3044335349,
              "converted_last": {
                "btc": 0.00067543,
                "eth": 0.0125102,
                "usd": 13.27
              },
              "converted_volume": {
                "btc": 877.335,
                "eth": 16250,
                "usd": 17232638
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.075529,
              "timestamp": "2022-06-19T16:35:05+00:00",
              "last_traded_at": "2022-06-19T16:35:05+00:00",
              "last_fetch_at": "2022-06-19T16:35:05+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/AXS_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "axie-infinity",
              "target_coin_id": "tether"
            },
            {
              "base": "PAXG",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 1837,
              "volume": 4874.536661404464,
              "converted_last": {
                "btc": 0.09356686,
                "eth": 1.733024,
                "usd": 1838.65
              },
              "converted_volume": {
                "btc": 456.095,
                "eth": 8448,
                "usd": 8962589
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.054407,
              "timestamp": "2022-06-19T16:33:59+00:00",
              "last_traded_at": "2022-06-19T16:33:59+00:00",
              "last_fetch_at": "2022-06-19T16:33:59+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/PAXG_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "pax-gold",
              "target_coin_id": "tether"
            },
            {
              "base": "ETH",
              "target": "EUR",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 1012.55,
              "volume": 82686.13797671167,
              "converted_last": {
                "btc": 0.05414641,
                "eth": 1.003557,
                "usd": 1062.77
              },
              "converted_volume": {
                "btc": 4477,
                "eth": 82980,
                "usd": 87876543
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.024148,
              "timestamp": "2022-06-19T16:39:53+00:00",
              "last_traded_at": "2022-06-19T16:39:53+00:00",
              "last_fetch_at": "2022-06-19T16:39:53+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/ETH_EUR?ref=37754157",
              "token_info_url": null,
              "coin_id": "ethereum"
            },
            {
              "base": "PAXG",
              "target": "BUSD",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 1835,
              "volume": 4557.247800435967,
              "converted_last": {
                "btc": 0.09370334,
                "eth": 1.735792,
                "usd": 1841.18
              },
              "converted_volume": {
                "btc": 427.029,
                "eth": 7910,
                "usd": 8390722
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.054437,
              "timestamp": "2022-06-19T16:27:13+00:00",
              "last_traded_at": "2022-06-19T16:27:13+00:00",
              "last_fetch_at": "2022-06-19T16:27:13+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/PAXG_BUSD?ref=37754157",
              "token_info_url": null,
              "coin_id": "pax-gold",
              "target_coin_id": "binance-usd"
            },
            {
              "base": "VET",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.02222,
              "volume": 1578868117.3691719,
              "converted_last": {
                "btc": 0.00000113,
                "eth": 0.00002096,
                "usd": 0.02224001
              },
              "converted_volume": {
                "btc": 1787,
                "eth": 33097,
                "usd": 35114049
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.045005,
              "timestamp": "2022-06-19T16:33:49+00:00",
              "last_traded_at": "2022-06-19T16:33:49+00:00",
              "last_fetch_at": "2022-06-19T16:33:49+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/VET_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "vechain",
              "target_coin_id": "tether"
            },
            {
              "base": "GALA",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.05388,
              "volume": 1046531664.5193021,
              "converted_last": {
                "btc": 0.00000275,
                "eth": 0.00005104,
                "usd": 0.054102
              },
              "converted_volume": {
                "btc": 2881,
                "eth": 53419,
                "usd": 56619808
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.018403,
              "timestamp": "2022-06-19T16:24:08+00:00",
              "last_traded_at": "2022-06-19T16:24:08+00:00",
              "last_fetch_at": "2022-06-19T16:24:08+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/GALA_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "gala",
              "target_coin_id": "tether"
            },
            {
              "base": "ATOM",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 6.48,
              "volume": 5533216.76555787,
              "converted_last": {
                "btc": 0.00033055,
                "eth": 0.00612121,
                "usd": 6.49
              },
              "converted_volume": {
                "btc": 1829,
                "eth": 33870,
                "usd": 35924948
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.154321,
              "timestamp": "2022-06-19T16:29:46+00:00",
              "last_traded_at": "2022-06-19T16:29:46+00:00",
              "last_fetch_at": "2022-06-19T16:29:46+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/ATOM_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "cosmos",
              "target_coin_id": "tether"
            },
            {
              "base": "XTZ",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 1.311,
              "volume": 6607952.722959572,
              "converted_last": {
                "btc": 0.00006687,
                "eth": 0.00123823,
                "usd": 1.31
              },
              "converted_volume": {
                "btc": 441.906,
                "eth": 8182,
                "usd": 8681871
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.075529,
              "timestamp": "2022-06-19T16:28:55+00:00",
              "last_traded_at": "2022-06-19T16:28:55+00:00",
              "last_fetch_at": "2022-06-19T16:28:55+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/XTZ_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "tezos",
              "target_coin_id": "tether"
            },
            {
              "base": "EOS",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.924,
              "volume": 20031068.473484848,
              "converted_last": {
                "btc": 0.00004704,
                "eth": 0.00087257,
                "usd": 0.928311
              },
              "converted_volume": {
                "btc": 942.355,
                "eth": 17479,
                "usd": 18595068
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.107991,
              "timestamp": "2022-06-19T16:20:50+00:00",
              "last_traded_at": "2022-06-19T16:20:50+00:00",
              "last_fetch_at": "2022-06-19T16:20:50+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/EOS_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "eos",
              "target_coin_id": "tether"
            },
            {
              "base": "SHIB",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.00000803,
              "volume": 6434163523570.173,
              "converted_last": {
                "btc": 4.05742e-10,
                "eth": 7.54e-9,
                "usd": 0.00000804
              },
              "converted_volume": {
                "btc": 2611,
                "eth": 48513,
                "usd": 51744748
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.124533,
              "timestamp": "2022-06-19T16:02:15+00:00",
              "last_traded_at": "2022-06-19T16:02:15+00:00",
              "last_fetch_at": "2022-06-19T16:02:15+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/SHIB_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "shiba-inu",
              "target_coin_id": "tether"
            },
            {
              "base": "ALGO",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.3047,
              "volume": 64966164.079094194,
              "converted_last": {
                "btc": 0.00001555,
                "eth": 0.00028829,
                "usd": 0.305296
              },
              "converted_volume": {
                "btc": 1011,
                "eth": 18729,
                "usd": 19833885
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.032808,
              "timestamp": "2022-06-19T16:39:47+00:00",
              "last_traded_at": "2022-06-19T16:39:47+00:00",
              "last_fetch_at": "2022-06-19T16:39:47+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/ALGO_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "algorand",
              "target_coin_id": "tether"
            },
            {
              "base": "PEOPLE",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.02442,
              "volume": 2103275121.3470926,
              "converted_last": {
                "btc": 0.00000125,
                "eth": 0.00002311,
                "usd": 0.02446923
              },
              "converted_volume": {
                "btc": 2622,
                "eth": 48597,
                "usd": 51465515
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.040883,
              "timestamp": "2022-06-19T16:38:16+00:00",
              "last_traded_at": "2022-06-19T16:38:16+00:00",
              "last_fetch_at": "2022-06-19T16:38:16+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/PEOPLE_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "constitutiondao",
              "target_coin_id": "tether"
            },
            {
              "base": "BUSD",
              "target": "BIDR",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 14864,
              "volume": 2684541.331330732,
              "converted_last": {
                "btc": 0.00005113,
                "eth": 0.00094767,
                "usd": 1.004
              },
              "converted_volume": {
                "btc": 137.264,
                "eth": 2544,
                "usd": 2694180
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.016728,
              "timestamp": "2022-06-19T16:39:56+00:00",
              "last_traded_at": "2022-06-19T16:39:56+00:00",
              "last_fetch_at": "2022-06-19T16:39:56+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/BUSD_BIDR?ref=37754157",
              "token_info_url": null,
              "coin_id": "binance-usd",
              "target_coin_id": "binanceidr"
            },
            {
              "base": "GMT",
              "target": "BUSD",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.6376,
              "volume": 44874393.39808187,
              "converted_last": {
                "btc": 0.00003256,
                "eth": 0.00060346,
                "usd": 0.63908
              },
              "converted_volume": {
                "btc": 1461,
                "eth": 27080,
                "usd": 28678315
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.026672,
              "timestamp": "2022-06-19T16:38:18+00:00",
              "last_traded_at": "2022-06-19T16:38:18+00:00",
              "last_fetch_at": "2022-06-19T16:38:18+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/GMT_BUSD?ref=37754157",
              "token_info_url": null,
              "coin_id": "stepn",
              "target_coin_id": "binance-usd"
            },
            {
              "base": "ETC",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 14.58,
              "volume": 1637129.4482098764,
              "converted_last": {
                "btc": 0.00074263,
                "eth": 0.01375492,
                "usd": 14.59
              },
              "converted_volume": {
                "btc": 1216,
                "eth": 22519,
                "usd": 23891302
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.068493,
              "timestamp": "2022-06-19T16:32:48+00:00",
              "last_traded_at": "2022-06-19T16:32:48+00:00",
              "last_fetch_at": "2022-06-19T16:32:48+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/ETC_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "ethereum-classic",
              "target_coin_id": "tether"
            },
            {
              "base": "ADA",
              "target": "USDC",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.4651,
              "volume": 14293969.97458611,
              "converted_last": {
                "btc": 0.0000238,
                "eth": 0.00044107,
                "usd": 0.467097
              },
              "converted_volume": {
                "btc": 340.165,
                "eth": 6305,
                "usd": 6676669
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.085948,
              "timestamp": "2022-06-19T16:39:46+00:00",
              "last_traded_at": "2022-06-19T16:39:46+00:00",
              "last_fetch_at": "2022-06-19T16:39:46+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/ADA_USDC?ref=37754157",
              "token_info_url": null,
              "coin_id": "cardano",
              "target_coin_id": "usd-coin"
            },
            {
              "base": "USDT",
              "target": "RUB",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 58,
              "volume": 1216457.0755172414,
              "converted_last": {
                "btc": 0.00005135,
                "eth": 0.000951,
                "usd": 1.009
              },
              "converted_volume": {
                "btc": 62.47,
                "eth": 1157,
                "usd": 1227037
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.051617,
              "timestamp": "2022-06-19T16:29:49+00:00",
              "last_traded_at": "2022-06-19T16:29:49+00:00",
              "last_fetch_at": "2022-06-19T16:29:49+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/USDT_RUB?ref=37754157",
              "token_info_url": null,
              "coin_id": "tether"
            },
            {
              "base": "SOL",
              "target": "BTC",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.0016666,
              "volume": 1016822.2630685228,
              "converted_last": {
                "btc": 0.0016666,
                "eth": 0.03089007,
                "usd": 32.72
              },
              "converted_volume": {
                "btc": 1695,
                "eth": 31410,
                "usd": 33270964
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.024004,
              "timestamp": "2022-06-19T16:37:58+00:00",
              "last_traded_at": "2022-06-19T16:37:58+00:00",
              "last_fetch_at": "2022-06-19T16:37:58+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/SOL_BTC?ref=37754157",
              "token_info_url": null,
              "coin_id": "solana",
              "target_coin_id": "bitcoin"
            },
            {
              "base": "BTC",
              "target": "DAI",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 19593.35,
              "volume": 964.1225232276308,
              "converted_last": {
                "btc": 0.99981531,
                "eth": 18.518573,
                "usd": 19647.45
              },
              "converted_volume": {
                "btc": 963.944,
                "eth": 17854,
                "usd": 18942548
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.088873,
              "timestamp": "2022-06-19T16:32:54+00:00",
              "last_traded_at": "2022-06-19T16:32:54+00:00",
              "last_fetch_at": "2022-06-19T16:32:54+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/BTC_DAI?ref=37754157",
              "token_info_url": null,
              "coin_id": "bitcoin",
              "target_coin_id": "dai"
            },
            {
              "base": "XRP",
              "target": "USDC",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.3154,
              "volume": 15786258.31642359,
              "converted_last": {
                "btc": 0.00001614,
                "eth": 0.00029911,
                "usd": 0.316754
              },
              "converted_volume": {
                "btc": 254.76,
                "eth": 4722,
                "usd": 5000363
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.063532,
              "timestamp": "2022-06-19T16:39:45+00:00",
              "last_traded_at": "2022-06-19T16:39:45+00:00",
              "last_fetch_at": "2022-06-19T16:39:45+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/XRP_USDC?ref=37754157",
              "token_info_url": null,
              "coin_id": "ripple",
              "target_coin_id": "usd-coin"
            },
            {
              "base": "APE",
              "target": "BUSD",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 3.8997,
              "volume": 5736402.950966741,
              "converted_last": {
                "btc": 0.00019913,
                "eth": 0.00369074,
                "usd": 3.91
              },
              "converted_volume": {
                "btc": 1142,
                "eth": 21172,
                "usd": 22420800
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.018038,
              "timestamp": "2022-06-19T16:39:10+00:00",
              "last_traded_at": "2022-06-19T16:39:10+00:00",
              "last_fetch_at": "2022-06-19T16:39:10+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/APE_BUSD?ref=37754157",
              "token_info_url": null,
              "coin_id": "apecoin",
              "target_coin_id": "binance-usd"
            },
            {
              "base": "LIT",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.988,
              "volume": 72217733.07044534,
              "converted_last": {
                "btc": 0.00005044,
                "eth": 0.00093481,
                "usd": 0.989992
              },
              "converted_volume": {
                "btc": 3642,
                "eth": 67510,
                "usd": 71494952
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.200401,
              "timestamp": "2022-06-19T16:38:14+00:00",
              "last_traded_at": "2022-06-19T16:38:14+00:00",
              "last_fetch_at": "2022-06-19T16:38:14+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/LIT_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "litentry",
              "target_coin_id": "tether"
            },
            {
              "base": "ZEC",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 62.6,
              "volume": 181122.3001474425,
              "converted_last": {
                "btc": 0.00319326,
                "eth": 0.05913388,
                "usd": 62.72
              },
              "converted_volume": {
                "btc": 578.371,
                "eth": 10710,
                "usd": 11360298
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.162602,
              "timestamp": "2022-06-19T16:29:49+00:00",
              "last_traded_at": "2022-06-19T16:29:49+00:00",
              "last_fetch_at": "2022-06-19T16:29:49+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/ZEC_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "zcash",
              "target_coin_id": "tether"
            },
            {
              "base": "DOGE",
              "target": "BUSD",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.05781,
              "volume": 632776839.8128351,
              "converted_last": {
                "btc": 0.00000295,
                "eth": 0.00005468,
                "usd": 0.058008
              },
              "converted_volume": {
                "btc": 1868,
                "eth": 34598,
                "usd": 36706362
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.034423,
              "timestamp": "2022-06-19T16:33:58+00:00",
              "last_traded_at": "2022-06-19T16:33:58+00:00",
              "last_fetch_at": "2022-06-19T16:33:58+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/DOGE_BUSD?ref=37754157",
              "token_info_url": null,
              "coin_id": "dogecoin",
              "target_coin_id": "binance-usd"
            },
            {
              "base": "XMR",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 109.5,
              "volume": 153041.24554246577,
              "converted_last": {
                "btc": 0.00558609,
                "eth": 0.10346424,
                "usd": 109.72
              },
              "converted_volume": {
                "btc": 854.902,
                "eth": 15834,
                "usd": 16792005
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.091158,
              "timestamp": "2022-06-19T16:35:54+00:00",
              "last_traded_at": "2022-06-19T16:35:54+00:00",
              "last_fetch_at": "2022-06-19T16:35:54+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/XMR_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "monero",
              "target_coin_id": "tether"
            },
            {
              "base": "EGLD",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 48.91,
              "volume": 545875.0970639951,
              "converted_last": {
                "btc": 0.00249512,
                "eth": 0.04621403,
                "usd": 49.01
              },
              "converted_volume": {
                "btc": 1362,
                "eth": 25227,
                "usd": 26752901
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.040908,
              "timestamp": "2022-06-19T16:35:01+00:00",
              "last_traded_at": "2022-06-19T16:35:01+00:00",
              "last_fetch_at": "2022-06-19T16:35:01+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/EGLD_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "elrond-erd-2",
              "target_coin_id": "tether"
            },
            {
              "base": "LTC",
              "target": "BUSD",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 51.93,
              "volume": 437627.0654889274,
              "converted_last": {
                "btc": 0.00265172,
                "eth": 0.04914736,
                "usd": 52.05
              },
              "converted_volume": {
                "btc": 1160,
                "eth": 21508,
                "usd": 22777327
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.05814,
              "timestamp": "2022-06-19T16:39:50+00:00",
              "last_traded_at": "2022-06-19T16:39:50+00:00",
              "last_fetch_at": "2022-06-19T16:39:50+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/LTC_BUSD?ref=37754157",
              "token_info_url": null,
              "coin_id": "litecoin",
              "target_coin_id": "binance-usd"
            },
            {
              "base": "BTC",
              "target": "GBP",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 16034.67,
              "volume": 1333.8471304599727,
              "converted_last": {
                "btc": 0.99372204,
                "eth": 18.431272,
                "usd": 19603.2
              },
              "converted_volume": {
                "btc": 1325,
                "eth": 24584,
                "usd": 26147668
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.043856,
              "timestamp": "2022-06-19T16:21:55+00:00",
              "last_traded_at": "2022-06-19T16:21:55+00:00",
              "last_fetch_at": "2022-06-19T16:21:55+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/BTC_GBP?ref=37754157",
              "token_info_url": null,
              "coin_id": "bitcoin"
            },
            {
              "base": "UNFI",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 5.154,
              "volume": 4107336.977435002,
              "converted_last": {
                "btc": 0.0002631,
                "eth": 0.00487651,
                "usd": 5.16
              },
              "converted_volume": {
                "btc": 1081,
                "eth": 20029,
                "usd": 21211888
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.03888,
              "timestamp": "2022-06-19T16:38:08+00:00",
              "last_traded_at": "2022-06-19T16:38:08+00:00",
              "last_fetch_at": "2022-06-19T16:38:08+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/UNFI_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "unifi-protocol-dao",
              "target_coin_id": "tether"
            },
            {
              "base": "OP",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.486,
              "volume": 40738264.264917694,
              "converted_last": {
                "btc": 0.00002477,
                "eth": 0.00045856,
                "usd": 0.486565
              },
              "converted_volume": {
                "btc": 1009,
                "eth": 18681,
                "usd": 19821794
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.203666,
              "timestamp": "2022-06-19T16:28:17+00:00",
              "last_traded_at": "2022-06-19T16:28:17+00:00",
              "last_fetch_at": "2022-06-19T16:28:17+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/OP_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "optimism",
              "target_coin_id": "tether"
            },
            {
              "base": "FTT",
              "target": "BTC",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.0012142,
              "volume": 45726.0600395322,
              "converted_last": {
                "btc": 0.0012142,
                "eth": 0.02250414,
                "usd": 23.83
              },
              "converted_volume": {
                "btc": 55.521,
                "eth": 1029,
                "usd": 1089744
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.090513,
              "timestamp": "2022-06-19T16:39:52+00:00",
              "last_traded_at": "2022-06-19T16:39:52+00:00",
              "last_fetch_at": "2022-06-19T16:39:52+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/FTT_BTC?ref=37754157",
              "token_info_url": null,
              "coin_id": "ftx-token",
              "target_coin_id": "bitcoin"
            },
            {
              "base": "BTC",
              "target": "TRY",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 343184,
              "volume": 1741.5863260346111,
              "converted_last": {
                "btc": 1.003937,
                "eth": 18.620742,
                "usd": 19804.71
              },
              "converted_volume": {
                "btc": 1748,
                "eth": 32430,
                "usd": 34491618
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.010588,
              "timestamp": "2022-06-19T16:21:52+00:00",
              "last_traded_at": "2022-06-19T16:21:52+00:00",
              "last_fetch_at": "2022-06-19T16:21:52+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/BTC_TRY?ref=37754157",
              "token_info_url": null,
              "coin_id": "bitcoin"
            },
            {
              "base": "ADA",
              "target": "BTC",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.00002375,
              "volume": 40688725.05136842,
              "converted_last": {
                "btc": 0.00002375,
                "eth": 0.00044059,
                "usd": 0.466766
              },
              "converted_volume": {
                "btc": 966.357,
                "eth": 17927,
                "usd": 18992113
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.042052,
              "timestamp": "2022-06-19T16:23:45+00:00",
              "last_traded_at": "2022-06-19T16:23:45+00:00",
              "last_fetch_at": "2022-06-19T16:23:45+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/ADA_BTC?ref=37754157",
              "token_info_url": null,
              "coin_id": "cardano",
              "target_coin_id": "bitcoin"
            },
            {
              "base": "DOT",
              "target": "BUSD",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 7.26,
              "volume": 2823944.39738292,
              "converted_last": {
                "btc": 0.00037052,
                "eth": 0.00687067,
                "usd": 7.28
              },
              "converted_volume": {
                "btc": 1046,
                "eth": 19402,
                "usd": 20565152
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.137552,
              "timestamp": "2022-06-19T16:25:01+00:00",
              "last_traded_at": "2022-06-19T16:25:01+00:00",
              "last_fetch_at": "2022-06-19T16:25:01+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/DOT_BUSD?ref=37754157",
              "token_info_url": null,
              "coin_id": "polkadot",
              "target_coin_id": "binance-usd"
            },
            {
              "base": "TRX",
              "target": "BTC",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.00000303,
              "volume": 290630491.7293729,
              "converted_last": {
                "btc": 0.00000303,
                "eth": 0.00005622,
                "usd": 0.059831
              },
              "converted_volume": {
                "btc": 880.61,
                "eth": 16338,
                "usd": 17388782
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.328947,
              "timestamp": "2022-06-19T16:18:58+00:00",
              "last_traded_at": "2022-06-19T16:18:58+00:00",
              "last_fetch_at": "2022-06-19T16:18:58+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/TRX_BTC?ref=37754157",
              "token_info_url": null,
              "coin_id": "tron",
              "target_coin_id": "bitcoin"
            },
            {
              "base": "THETA",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 1.169,
              "volume": 13796741.749358427,
              "converted_last": {
                "btc": 0.00005967,
                "eth": 0.00110602,
                "usd": 1.17
              },
              "converted_volume": {
                "btc": 823.32,
                "eth": 15260,
                "usd": 16159918
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.171086,
              "timestamp": "2022-06-19T16:39:47+00:00",
              "last_traded_at": "2022-06-19T16:39:47+00:00",
              "last_fetch_at": "2022-06-19T16:39:47+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/THETA_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "theta-token",
              "target_coin_id": "tether"
            },
            {
              "base": "RUNE",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 1.648,
              "volume": 15622991.330643203,
              "converted_last": {
                "btc": 0.00008413,
                "eth": 0.00155927,
                "usd": 1.65
              },
              "converted_volume": {
                "btc": 1314,
                "eth": 24361,
                "usd": 25798591
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.060643,
              "timestamp": "2022-06-19T16:38:57+00:00",
              "last_traded_at": "2022-06-19T16:38:57+00:00",
              "last_fetch_at": "2022-06-19T16:38:57+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/RUNE_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "thorchain",
              "target_coin_id": "tether"
            },
            {
              "base": "JASMY",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.009362,
              "volume": 3214059889.7908354,
              "converted_last": {
                "btc": 4.76658e-7,
                "eth": 0.00000884,
                "usd": 0.00940207
              },
              "converted_volume": {
                "btc": 1532,
                "eth": 28421,
                "usd": 30218828
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.053407,
              "timestamp": "2022-06-19T16:22:11+00:00",
              "last_traded_at": "2022-06-19T16:22:11+00:00",
              "last_fetch_at": "2022-06-19T16:22:11+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/JASMY_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "jasmycoin",
              "target_coin_id": "tether"
            },
            {
              "base": "LINK",
              "target": "BUSD",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 6.36,
              "volume": 2385133.5245125787,
              "converted_last": {
                "btc": 0.000325,
                "eth": 0.00601847,
                "usd": 6.38
              },
              "converted_volume": {
                "btc": 775.17,
                "eth": 14355,
                "usd": 15225812
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.15674,
              "timestamp": "2022-06-19T16:29:48+00:00",
              "last_traded_at": "2022-06-19T16:29:48+00:00",
              "last_fetch_at": "2022-06-19T16:29:48+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/LINK_BUSD?ref=37754157",
              "token_info_url": null,
              "coin_id": "chainlink",
              "target_coin_id": "binance-usd"
            },
            {
              "base": "XLM",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.1127,
              "volume": 160603821.34338954,
              "converted_last": {
                "btc": 0.00000576,
                "eth": 0.0001067,
                "usd": 0.113157
              },
              "converted_volume": {
                "btc": 924.699,
                "eth": 17137,
                "usd": 18173519
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.088496,
              "timestamp": "2022-06-19T16:25:46+00:00",
              "last_traded_at": "2022-06-19T16:25:46+00:00",
              "last_fetch_at": "2022-06-19T16:25:46+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/XLM_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "stellar",
              "target_coin_id": "tether"
            },
            {
              "base": "ETH",
              "target": "DAI",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 1059.73,
              "volume": 31715.50072008719,
              "converted_last": {
                "btc": 0.05392973,
                "eth": 1.000046,
                "usd": 1059.98
              },
              "converted_volume": {
                "btc": 1710,
                "eth": 31717,
                "usd": 33617688
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.051833,
              "timestamp": "2022-06-19T16:24:11+00:00",
              "last_traded_at": "2022-06-19T16:24:11+00:00",
              "last_fetch_at": "2022-06-19T16:24:11+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/ETH_DAI?ref=37754157",
              "token_info_url": null,
              "coin_id": "ethereum",
              "target_coin_id": "dai"
            },
            {
              "base": "HNT",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 11.09,
              "volume": 1408706.8486925159,
              "converted_last": {
                "btc": 0.00056612,
                "eth": 0.01049293,
                "usd": 11.11
              },
              "converted_volume": {
                "btc": 797.498,
                "eth": 14781,
                "usd": 15654051
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.090253,
              "timestamp": "2022-06-19T16:38:03+00:00",
              "last_traded_at": "2022-06-19T16:38:03+00:00",
              "last_fetch_at": "2022-06-19T16:38:03+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/HNT_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "helium",
              "target_coin_id": "tether"
            },
            {
              "base": "LUNC",
              "target": "BUSD",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.0000565,
              "volume": 595551158920.5298,
              "converted_last": {
                "btc": 2.885e-9,
                "eth": 5.342e-8,
                "usd": 0.00005668
              },
              "converted_volume": {
                "btc": 1718,
                "eth": 31815,
                "usd": 33757498
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.070609,
              "timestamp": "2022-06-19T16:28:17+00:00",
              "last_traded_at": "2022-06-19T16:28:17+00:00",
              "last_fetch_at": "2022-06-19T16:28:17+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/LUNC_BUSD?ref=37754157",
              "token_info_url": null,
              "coin_id": "terra-luna",
              "target_coin_id": "binance-usd"
            },
            {
              "base": "NEAR",
              "target": "BUSD",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 3.162,
              "volume": 4375852.916129032,
              "converted_last": {
                "btc": 0.00016146,
                "eth": 0.00299057,
                "usd": 3.17
              },
              "converted_volume": {
                "btc": 706.536,
                "eth": 13086,
                "usd": 13877791
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.094907,
              "timestamp": "2022-06-19T16:35:04+00:00",
              "last_traded_at": "2022-06-19T16:35:04+00:00",
              "last_fetch_at": "2022-06-19T16:35:04+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/NEAR_BUSD?ref=37754157",
              "token_info_url": null,
              "coin_id": "near",
              "target_coin_id": "binance-usd"
            },
            {
              "base": "VET",
              "target": "BUSD",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.02222,
              "volume": 320476712.8650765,
              "converted_last": {
                "btc": 0.00000113,
                "eth": 0.00002104,
                "usd": 0.02238086
              },
              "converted_volume": {
                "btc": 363.589,
                "eth": 6744,
                "usd": 7172543
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.090498,
              "timestamp": "2022-06-19T16:21:49+00:00",
              "last_traded_at": "2022-06-19T16:21:49+00:00",
              "last_fetch_at": "2022-06-19T16:21:49+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/VET_BUSD?ref=37754157",
              "token_info_url": null,
              "coin_id": "vechain",
              "target_coin_id": "binance-usd"
            },
            {
              "base": "FIL",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 5.26,
              "volume": 4096141.00769962,
              "converted_last": {
                "btc": 0.00026851,
                "eth": 0.00497681,
                "usd": 5.27
              },
              "converted_volume": {
                "btc": 1100,
                "eth": 20386,
                "usd": 21589134
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.189753,
              "timestamp": "2022-06-19T16:38:08+00:00",
              "last_traded_at": "2022-06-19T16:38:08+00:00",
              "last_fetch_at": "2022-06-19T16:38:08+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/FIL_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "filecoin",
              "target_coin_id": "tether"
            },
            {
              "base": "UNI",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 3.95,
              "volume": 3717815.844734177,
              "converted_last": {
                "btc": 0.00020164,
                "eth": 0.0037372,
                "usd": 3.96
              },
              "converted_volume": {
                "btc": 749.657,
                "eth": 13894,
                "usd": 14713880
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.253165,
              "timestamp": "2022-06-19T16:40:03+00:00",
              "last_traded_at": "2022-06-19T16:40:03+00:00",
              "last_fetch_at": "2022-06-19T16:40:03+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/UNI_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "uniswap",
              "target_coin_id": "tether"
            },
            {
              "base": "ZIL",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.03282,
              "volume": 692531598.3432359,
              "converted_last": {
                "btc": 0.00000168,
                "eth": 0.00003105,
                "usd": 0.03288415
              },
              "converted_volume": {
                "btc": 1160,
                "eth": 21504,
                "usd": 22773316
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.060478,
              "timestamp": "2022-06-19T16:39:45+00:00",
              "last_traded_at": "2022-06-19T16:39:45+00:00",
              "last_fetch_at": "2022-06-19T16:39:45+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/ZIL_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "zilliqa",
              "target_coin_id": "tether"
            },
            {
              "base": "DYDX",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 1.177,
              "volume": 9269453.059728123,
              "converted_last": {
                "btc": 0.00006004,
                "eth": 0.00111262,
                "usd": 1.18
              },
              "converted_volume": {
                "btc": 556.576,
                "eth": 10313,
                "usd": 10929699
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.084531,
              "timestamp": "2022-06-19T16:36:12+00:00",
              "last_traded_at": "2022-06-19T16:36:12+00:00",
              "last_fetch_at": "2022-06-19T16:36:12+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/DYDX_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "dydx",
              "target_coin_id": "tether"
            },
            {
              "base": "SHIB",
              "target": "BUSD",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.00000799,
              "volume": 2323232128555.015,
              "converted_last": {
                "btc": 4.07997e-10,
                "eth": 7.562e-9,
                "usd": 0.00000801
              },
              "converted_volume": {
                "btc": 947.871,
                "eth": 17569,
                "usd": 18609643
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.126422,
              "timestamp": "2022-06-19T16:37:15+00:00",
              "last_traded_at": "2022-06-19T16:37:15+00:00",
              "last_fetch_at": "2022-06-19T16:37:15+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/SHIB_BUSD?ref=37754157",
              "token_info_url": null,
              "coin_id": "shiba-inu",
              "target_coin_id": "binance-usd"
            },
            {
              "base": "LRC",
              "target": "USDT",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.3564,
              "volume": 30871463.17929293,
              "converted_last": {
                "btc": 0.00001815,
                "eth": 0.00033656,
                "usd": 0.357963
              },
              "converted_volume": {
                "btc": 560.188,
                "eth": 10390,
                "usd": 11050845
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.055866,
              "timestamp": "2022-06-19T16:21:55+00:00",
              "last_traded_at": "2022-06-19T16:21:55+00:00",
              "last_fetch_at": "2022-06-19T16:21:55+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/LRC_USDT?ref=37754157",
              "token_info_url": null,
              "coin_id": "loopring",
              "target_coin_id": "tether"
            },
            {
              "base": "DOGE",
              "target": "BTC",
              "market": {
                "name": "Binance",
                "identifier": "binance",
                "has_trading_incentive": false
              },
              "last": 0.00000296,
              "volume": 274545087.9695946,
              "converted_last": {
                "btc": 0.00000296,
                "eth": 0.00005482,
                "usd": 0.058166
              },
              "converted_volume": {
                "btc": 812.653,
                "eth": 15052,
                "usd": 15969212
              },
              "trust_score": "green",
              "bid_ask_spread_percentage": 0.340136,
              "timestamp": "2022-06-19T16:33:53+00:00",
              "last_traded_at": "2022-06-19T16:33:53+00:00",
              "last_fetch_at": "2022-06-19T16:33:53+00:00",
              "is_anomaly": false,
              "is_stale": false,
              "trade_url": "https://www.binance.com/en/trade/DOGE_BTC?ref=37754157",
              "token_info_url": null,
              "coin_id": "dogecoin",
              "target_coin_id": "bitcoin"
            }
          ],
          "status_updates": [
            {
              "description": "Juventus and Paris Saint-Germain Fan Tokens on Binance Launchpool! \r\n\r\nFarm JUV and PSG tokens By Staking BNB, BUSD & CHZ Tokens\r\n\r\nClick here➡️ https://ter.li/JUV-and-PSG-tokens",
              "category": "general",
              "created_at": "2020-12-14T11:18:49.085Z",
              "user": "Darc",
              "user_title": "Marketing",
              "pin": false,
              "project": {
                "type": "Market",
                "id": "binance",
                "name": "Binance",
                "image": {
                  "thumb": "https://assets.coingecko.com/markets/images/52/thumb/binance.jpg?1519353250",
                  "small": "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250",
                  "large": "https://assets.coingecko.com/markets/images/52/large/binance.jpg?1519353250"
                }
              }
            },
            {
              "description": "Binance Black Friday - $100,000 in Bitcoin Up For Grabs!\r\n\r\nComplete tasks on Binance to get a guaranteed Bitcoin payout and to enter a lucky draw.\r\n\r\nGet started ➡️ https://ter.li/Binance-Black-Friday",
              "category": "general",
              "created_at": "2020-11-24T09:37:17.816Z",
              "user": "Darc",
              "user_title": "Marketing",
              "pin": false,
              "project": {
                "type": "Market",
                "id": "binance",
                "name": "Binance",
                "image": {
                  "thumb": "https://assets.coingecko.com/markets/images/52/thumb/binance.jpg?1519353250",
                  "small": "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250",
                  "large": "https://assets.coingecko.com/markets/images/52/large/binance.jpg?1519353250"
                }
              }
            },
            {
              "description": "Binance Weekly Report: Record BNB Burn at $68M\r\n\r\nRead here ➡️ https://ter.li/Binance-Report-October-23",
              "category": "general",
              "created_at": "2020-10-27T08:40:53.429Z",
              "user": "Darc",
              "user_title": "Marketing",
              "pin": false,
              "project": {
                "type": "Market",
                "id": "binance",
                "name": "Binance",
                "image": {
                  "thumb": "https://assets.coingecko.com/markets/images/52/thumb/binance.jpg?1519353250",
                  "small": "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250",
                  "large": "https://assets.coingecko.com/markets/images/52/large/binance.jpg?1519353250"
                }
              }
            },
            {
              "description": "Introducing the Axie Infinity (AXS) Token Sale on Binance Launchpad\r\n\r\nLearn more ➡️ https://ter.li/AXS-Launchpad-",
              "category": "general",
              "created_at": "2020-10-26T10:21:09.483Z",
              "user": "Darc",
              "user_title": "Marketing",
              "pin": false,
              "project": {
                "type": "Market",
                "id": "binance",
                "name": "Binance",
                "image": {
                  "thumb": "https://assets.coingecko.com/markets/images/52/thumb/binance.jpg?1519353250",
                  "small": "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250",
                  "large": "https://assets.coingecko.com/markets/images/52/large/binance.jpg?1519353250"
                }
              }
            },
            {
              "description": "Binance Weekly Report: Millions in Support of DeFi on BSC\r\n\r\n➡️ https://ter.li/Binance-Weekly-Report-Oct19",
              "category": "general",
              "created_at": "2020-10-19T09:35:48.597Z",
              "user": "Darc",
              "user_title": "Marketing",
              "pin": false,
              "project": {
                "type": "Market",
                "id": "binance",
                "name": "Binance",
                "image": {
                  "thumb": "https://assets.coingecko.com/markets/images/52/thumb/binance.jpg?1519353250",
                  "small": "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250",
                  "large": "https://assets.coingecko.com/markets/images/52/large/binance.jpg?1519353250"
                }
              }
            },
            {
              "description": "Introducing the Injective Protocol (INJ) Token Sale on Binance Launchpad\r\n\r\nLearn more ➡️ https://ter.li/INJ--Launchpad ",
              "category": "general",
              "created_at": "2020-10-12T09:11:29.099Z",
              "user": "Darc",
              "user_title": "Marketing",
              "pin": false,
              "project": {
                "type": "Market",
                "id": "binance",
                "name": "Binance",
                "image": {
                  "thumb": "https://assets.coingecko.com/markets/images/52/thumb/binance.jpg?1519353250",
                  "small": "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250",
                  "large": "https://assets.coingecko.com/markets/images/52/large/binance.jpg?1519353250"
                }
              }
            },
            {
              "description": "Binance Weekly Report: Innovate\r\n\r\nRead➡️ https://ter.li/Binance-Weekly-Report-Sep25",
              "category": "general",
              "created_at": "2020-10-01T09:13:15.236Z",
              "user": "Darc",
              "user_title": "Marketing",
              "pin": false,
              "project": {
                "type": "Market",
                "id": "binance",
                "name": "Binance",
                "image": {
                  "thumb": "https://assets.coingecko.com/markets/images/52/thumb/binance.jpg?1519353250",
                  "small": "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250",
                  "large": "https://assets.coingecko.com/markets/images/52/large/binance.jpg?1519353250"
                }
              }
            }
          ]
        }
        """.data(using: .utf8)!
        
    }

    override func tearDown() {
        self.request = nil
        self.jsonData = nil
        
        super.tearDown()
        
    }
    
    func testExchangesIdRequestTest_01() {
        XCTAssertTrue(self.request.url == "http://www.test.com/exchanges/binance")
        XCTAssertTrue(self.request.headers == [.accept: .applicationJson])
        XCTAssertTrue(self.request.method == .get)
    }
    
}
