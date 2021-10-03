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
    }

}

