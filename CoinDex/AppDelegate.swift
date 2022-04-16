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

    var appDelegateAssembler: AppDelegateAssembler?
    var composite: AppDelegateType?
    
    override init() {
        super.init()
        let assembler = AppDelegateAssembler()
        self.appDelegateAssembler = assembler
        self.composite = assembler.compositeAppDelegate()
    }

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
        _ = composite?.application?(application, didFinishLaunchingWithOptions: launchOptions)
        
        if let initialViewController = appDelegateAssembler?.launchScreenAssembler.viewController() {
            appDelegateAssembler?.navigationController.viewControllers = [initialViewController]
            appDelegateAssembler?.window.rootViewController = appDelegateAssembler?.navigationController
            appDelegateAssembler?.window.makeKeyAndVisible()
        }
        
        UNUserNotificationCenter.current().delegate = self

        return true
    }

}

extension AppDelegate: UNUserNotificationCenterDelegate {

    // Received in Foreground:
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        _ = composite?.userNotificationCenter?(center,
                                                willPresent: notification,
                                                withCompletionHandler: completionHandler)
    }

    // Received in Background:
    public func userNotificationCenter(_ userNotificationCenter: UNUserNotificationCenter,
                                       didReceive response: UNNotificationResponse,
                                       withCompletionHandler completionHandler: @escaping () -> Void) {
        _ = composite?.userNotificationCenter?(userNotificationCenter,
                                                didReceive: response,
                                                withCompletionHandler: completionHandler)
    }

}

extension AppDelegate {

    // MARK: Universal Links

    func application(_ application: UIApplication,
                     continue userActivity: NSUserActivity,
                     restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {

        return composite?.application?(application,
                                        continue: userActivity,
                                        restorationHandler: restorationHandler) ?? true
    }
}
    
