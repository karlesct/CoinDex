//
//  Copyright © 2022 CCT. All rights reserved.
//


import UserNotifications

public extension Permission {

    static var notification: NotificationPermission {
        return NotificationPermission()
    }
}


public class NotificationPermission: Permission {

    open override var type: PermissionTypeEnum { .notification }

    public override var status: PermissionStatusEnum {
        guard let authorizationStatus = fetchAuthorizationStatus() else { return .notDetermined }
        switch authorizationStatus {
        case .authorized: return .authorized
        case .denied: return .denied
        case .notDetermined: return .notDetermined
        case .provisional: return .authorized
        case .ephemeral: return .authorized
        @unknown default: return .denied
        }
    }

    private func fetchAuthorizationStatus() -> UNAuthorizationStatus? {
        var notificationSettings: UNNotificationSettings?
        let semaphore = DispatchSemaphore(value: 0)
        DispatchQueue.global().async {
            UNUserNotificationCenter.current().getNotificationSettings { setttings in
                notificationSettings = setttings
                semaphore.signal()
            }
        }
        semaphore.wait()
        return notificationSettings?.authorizationStatus
    }

    public override func request(completion: @escaping () -> Void) {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options:[.badge, .alert, .sound]) { (granted, error) in
            DispatchQueue.main.async {
                completion()
            }
        }
    }
}
