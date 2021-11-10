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
//        let request = PingRequest(baseURL: baseURL)
//        let request = CoinsListRequest(baseURL: baseURL)
//        let request = FinancePlatformsRequest(baseURL: baseURL)
//        let request = GlobalGlobalRequest(baseURL: baseURL)
//        let request = GlobalDecentralizedFinanceDefiRequest(baseURL: baseURL)
//        let request = TrendingRequest(baseURL: baseURL)
//        let request = ExchangeRateRequest(baseURL: baseURL)
//        let request = AssetPlatformsRequest(baseURL: baseURL)
//        let request = CategoriesListRequest(baseURL: baseURL)
//        let request = CategoriesRequest(baseURL: baseURL)
//        let request = EventsCountriesRequest(baseURL: baseURL)
//        let request = EventTypesRequest(baseURL: baseURL)
//        let request = EventsRequest(baseURL: baseURL)
//        let request = CompaniesRequest(baseURL: baseURL)
//        let request = StatusUpdateRequest(baseURL: baseURL)
//        let request = DerivativesRequest(baseURL: baseURL)
//        let request = DerivativesExchangesRequest(baseURL: baseURL)
//        let request = DerivativesExchangesListRequest(baseURL: baseURL)
//        let request = DerivativesExchangeDataRequest(baseURL: baseURL)
//        let request = IndexesRequest(baseURL: baseURL)
//        let request = IndexesListRequest(baseURL: baseURL)
//        let request = FinanceProductsRequest(baseURL: baseURL)
//        let request = SimpleSupportedVsCurrenciesRequest(baseURL: baseURL)
//        let request = ExchangesRequest(baseURL: baseURL)
//        let request = ExchangesListRequest(baseURL: baseURL)
//        let request = ExchangesIdRequest(baseURL: baseURL)
//        let request = ExchangesIdVolumeChartRequest(baseURL: baseURL)
//        let request = CoinsMarketsRequest(baseURL: baseURL)
        let request = CoinsIdRequest(baseURL: baseURL)

        test.fetch(request: request)
    }

}

class test {

    func fetch<T: DataRequest>(request: T) {
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





