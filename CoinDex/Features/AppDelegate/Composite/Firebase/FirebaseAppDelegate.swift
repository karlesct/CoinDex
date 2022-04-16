//  Copyright © 2021 MeetingDoctors. All rights reserved.

import UIKit
//import Firebase
//import FirebaseMessaging

class FirebaseAppDelegate: AppDelegateType {
    
    // MARK: - Properties
    
    private let logging: LoggingServiceProtocol
    
    // MARK: - Init
    
    init(logging: LoggingServiceProtocol) {
        self.logging = logging
    }
    
    // MARK: - Methods
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        FirebaseApp.configure()
//        Messaging.messaging().delegate = self
        return true
    }
}

//extension FirebaseAppDelegate: MessagingDelegate {
//
//    func messaging(_ messaging: Messaging,
//                   didReceiveRegistrationToken fcmToken: String?) {
//        
//    }
//
//}
