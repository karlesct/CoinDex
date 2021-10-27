//
//  ViewController.swift
//  CoinDex
//
//  Created by Carles Cañadas Torrents on 3/10/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        guard let configAPI = ConfigLoader.parseFile().API
        else { return }
        print(configAPI)
        let baseURL = configAPI.Scheme + configAPI.Host + configAPI.Path
        let test = test()
//        test.fetchPing(baseUR: baseURL)
//        test.fetchCoinList(baseUR: baseURL)
//        test.fetchFinancePlatforms(baseURL: baseURL)
//        test.fetchGlobalGlobal(baseURL: baseURL)
//        test.fetchGlobalDecentralizedFinanceDefi(baseURL: baseURL)
//        test.fetchTrendingRequest(baseURL: baseURL)
//        test.fetchExchangeRate(baseURL: baseURL)
        test.fetchAssetPlatform(baseURL: baseURL)
    }

}

class test {

    func fetchPing(baseURL: String) {
        let request = PingRequest(baseURL: baseURL)
        DefaultNetworkService().request(request) { [weak self] result in
            switch result {
            case .success(let model):
                NSLog("login url: \(model)")
            case .failure(let error):
                NSLog("login url: \(error)")
            }
        }
    }

    func fetchCoinList(baseURL: String) {
        let request = CoinsListRequest(baseURL: baseURL)
        DefaultNetworkService().request(request) { [weak self] result in
            switch result {
            case .success(let model):
                NSLog("login url: \(model)")
            case .failure(let error):
                NSLog("login url: \(error)")
            }
        }
    }

    func fetchFinancePlatforms(baseURL: String) {
        let request = FinancePlatformsRequest(baseURL: baseURL)
        DefaultNetworkService().request(request) { [weak self] result in
            switch result {
            case .success(let model):
                NSLog("login url: \(model)")
            case .failure(let error):
                NSLog("login url: \(error)")
            }
        }
    }

    func fetchGlobalGlobal(baseURL: String) {
        let request = GlobalGlobalRequest(baseURL: baseURL)
        DefaultNetworkService().request(request) { [weak self] result in
            switch result {
            case .success(let model):
                NSLog("login url: \(model)")
            case .failure(let error):
                NSLog("login url: \(error)")
            }
        }
    }

    func fetchGlobalDecentralizedFinanceDefi(baseURL: String) {
        let request = GlobalDecentralizedFinanceDefiRequest(baseURL: baseURL)
        DefaultNetworkService().request(request) { [weak self] result in
            switch result {
            case .success(let model):
                NSLog("login url: \(model)")
            case .failure(let error):
                NSLog("login url: \(error)")
            }
        }
    }

    func fetchTrendingRequest(baseURL: String) {
        let request = TrendingRequest(baseURL: baseURL)
        DefaultNetworkService().request(request) { [weak self] result in
            switch result {
            case .success(let model):
                NSLog("login url: \(model)")
            case .failure(let error):
                NSLog("login url: \(error)")
            }
        }
    }

    func fetchExchangeRate(baseURL: String) {
        let request = ExchangeRateRequest(baseURL: baseURL)
        DefaultNetworkService().request(request) { [weak self] result in
            switch result {
            case .success(let model):
                NSLog("login url: \(model)")
            case .failure(let error):
                NSLog("login url: \(error)")
            }
        }
    }

    func fetchAssetPlatform(baseURL: String) {
        let request = AssetPlatformsRequest(baseURL: baseURL)
        DefaultNetworkService().request(request) { [weak self] result in
            switch result {
            case .success(let model):
                NSLog("login url: \(model)")
            case .failure(let error):
                NSLog("login url: \(error)")
            }
        }
    }
}



