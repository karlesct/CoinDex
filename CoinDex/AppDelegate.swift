//
//  AppDelegate.swift
//  CoinDex
//
//  Created by Carles Cañadas Torrents on 3/10/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties

    var appDelegateAssembler = AppDelegateAssembler()

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        let initialViewController = appDelegateAssembler.launchScreenAssembler.viewController()

        appDelegateAssembler.navigationController.viewControllers = [initialViewController]

        appDelegateAssembler.window.rootViewController = appDelegateAssembler.navigationController

        appDelegateAssembler.window.makeKeyAndVisible()

        return true
    }

}

