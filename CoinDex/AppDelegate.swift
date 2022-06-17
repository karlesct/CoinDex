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
    
    public var window: UIWindow?
    
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
            window = appDelegateAssembler?.window
            appDelegateAssembler?.navigationController.viewControllers = [initialViewController]
            appDelegateAssembler?.window.rootViewController = appDelegateAssembler?.navigationController
            appDelegateAssembler?.window.makeKeyAndVisible()
        }
        
        UNUserNotificationCenter.current().delegate = self

        return true
    }

}

// MARK: - Notification

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
    func userNotificationCenter(_ userNotificationCenter: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        _ = composite?.userNotificationCenter?(userNotificationCenter,
                                                didReceive: response,
                                                withCompletionHandler: completionHandler)
    }

}

// MARK: Universal Links

extension AppDelegate {

    func application(_ application: UIApplication,
                     continue userActivity: NSUserActivity,
                     restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {

        return composite?.application?(application,
                                        continue: userActivity,
                                        restorationHandler: restorationHandler) ?? true
    }
}
    
// MARK: Deep Links

extension AppDelegate {
    
    func application(_ application: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        return composite?.application?(application,
                                       open: url,
                                       options: options) ?? true
    }
}
