//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation
import MapKit

public extension Permission {
    
    static var locationAlways: LocationAlwaysPermission {
        return LocationAlwaysPermission()
    }
}

public class LocationAlwaysPermission: Permission {
    
    open override var type: PermissionTypeEnum { .locationAlways }
    open var usageDescriptionKey: String? { "NSLocationAlwaysAndWhenInUseUsageDescription" }
    
    public override var status: PermissionStatusEnum {
        let authorizationStatus: CLAuthorizationStatus = {
            let locationManager = CLLocationManager()
            if #available(iOS 14.0, *) {
                return locationManager.authorizationStatus
            } else {
                return CLLocationManager.authorizationStatus()
            }
        }()
        
        switch authorizationStatus {
        case .authorized: return .authorized
        case .denied: return .denied
        case .notDetermined: return .notDetermined
        case .restricted: return .denied
        case .authorizedAlways: return .authorized
        case .authorizedWhenInUse: return .denied
        @unknown default: return .denied
        }
    }
    
    public var isPrecise: Bool {
        if #available(iOS 14.0, *) {
            switch CLLocationManager().accuracyAuthorization {
            case .fullAccuracy: return true
            case .reducedAccuracy: return false
            @unknown default: return false
            }
        }
        return false
    }
    
    public override func request(completion: @escaping () -> Void) {
        LocationAlwaysHandler.shared = LocationAlwaysHandler()
        LocationAlwaysHandler.shared?.requestPermission() {
            DispatchQueue.main.async {
                completion()
                LocationAlwaysHandler.shared = nil
            }
        }
    }
}
