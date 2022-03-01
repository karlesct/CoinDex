//
//  Copyright © 2022 CCT. All rights reserved.
//


import AppTrackingTransparency

@available(iOS 14.5, tvOS 14.5, *)
public extension Permission {

    static var tracking: TrackingPermission {
        return TrackingPermission()
    }
}

@available(iOS 14.5, tvOS 14.5, *)
public class TrackingPermission: Permission {

    open override var type: PermissionTypeEnum { .tracking }
    open var usageDescriptionKey: String? { "NSUserTrackingUsageDescription" }

    public override var status: PermissionStatusEnum {
        switch ATTrackingManager.trackingAuthorizationStatus {
        case .authorized: return .authorized
        case .denied: return .denied
        case .notDetermined: return .notDetermined
        case .restricted : return .denied
        @unknown default: return .denied
        }
    }

    public override func request(completion: @escaping () -> Void) {
        ATTrackingManager.requestTrackingAuthorization { _ in
            DispatchQueue.main.async {
                completion()
            }
        }
    }
}
