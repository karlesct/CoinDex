//
//  Copyright © 2022 CCT. All rights reserved.
//

import Foundation
import UIKit

typealias AppDelegateType = UIResponder & UIApplicationDelegate & UNUserNotificationCenterDelegate

class CompositeAppDelegate: AppDelegateType {
    
    // MARK: Properties
    
    private let appDelegates: [AppDelegateType?]
    
    // MARK: Init
    
    init(appDelegates: [AppDelegateType?]) {
        self.appDelegates = appDelegates
    }
    
    // MARK: Application
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        appDelegates.forEach { _ = $0?.application?(application,
                                                   didFinishLaunchingWithOptions: launchOptions) }
        return true
    }

    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        appDelegates.forEach { _ = $0?.application?(application,
                                                   didRegisterForRemoteNotificationsWithDeviceToken: deviceToken) }
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        appDelegates.forEach { _ = $0?.applicationDidBecomeActive?(application) }
    }
    
    // MARK: Push Notification
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        appDelegates.forEach { _ = $0?.userNotificationCenter?(center,
                                                             didReceive: response,
                                                             withCompletionHandler: completionHandler)}
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        appDelegates.forEach { _ = $0?.userNotificationCenter?(center,
                                                             willPresent: notification,
                                                             withCompletionHandler: completionHandler)}
    }
    
    // MARK: Universal Links
    
    func application(_ application: UIApplication,
                     continue userActivity: NSUserActivity,
                     restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        appDelegates.forEach { _ = $0?.application?(application,
                                                  continue: userActivity,
                                                  restorationHandler: restorationHandler)}
        return true
    }
}
