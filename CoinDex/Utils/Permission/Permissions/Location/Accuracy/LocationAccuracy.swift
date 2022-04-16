//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation
import MapKit

extension CLLocationManager {
    
    open func setAccuracy(_ value: LocationAccuracy) {
        self.desiredAccuracy = value.coreLocationAccuracy
    }
}

public enum LocationAccuracy {
    
    case best
    case bestForNavigation
    case nearestTenMeters
    case hundredMeters
    case kilometer
    case threeKilometers
    case reduced
    
    var coreLocationAccuracy: CLLocationAccuracy {
        switch self {
        case .best: return kCLLocationAccuracyBest
        case .bestForNavigation: return  kCLLocationAccuracyBestForNavigation
        case .nearestTenMeters: return kCLLocationAccuracyNearestTenMeters
        case .hundredMeters: return kCLLocationAccuracyHundredMeters
        case .kilometer: return kCLLocationAccuracyKilometer
        case .threeKilometers: return  kCLLocationAccuracyThreeKilometers
        case .reduced:
            if #available(iOS 14.0, tvOS 14.0, watchOS 7.0, *) {
                return kCLLocationAccuracyReduced
            } else {
                return kCLLocationAccuracyThreeKilometers
            }
        }
    }
}
