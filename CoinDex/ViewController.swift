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

        let config = ConfigLoader.parseFile()
        print(config.API)
        let test = test()
//        test.fetchPing()
        test.fetchCoinList()
    }

}

class test {

    func fetchPing() {
            let request = PingRequest()
            DefaultNetworkService().request(request) { [weak self] result in
                switch result {
                case .success(let model):
                    NSLog("login url: \(model)")
                case .failure(let error):
                    NSLog("login url: \(error)")
                }
            }
        }

    func fetchCoinList() {
            let request = CoinsListRequest()
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
