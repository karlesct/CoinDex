//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation
import MapKit

class LocationWhenInUseHandler: NSObject {
        
    // MARK: - Location Manager
    
    lazy var locationManager = CLLocationManager()
    
    // MARK: - Process
    
    var completionHandler: () -> Void = {}
    
    let authorizationStatus: CLAuthorizationStatus = {
        let locationManager = CLLocationManager()
        if #available(iOS 14.0, *) {
            return locationManager.authorizationStatus
        } else {
            return CLLocationManager.authorizationStatus()
        }
    }()
    
    func requestPermission(_ completionHandler: @escaping () -> Void) {
        self.completionHandler = completionHandler
        
        switch self.authorizationStatus {
        case .notDetermined:
            locationManager.delegate = self
            locationManager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse:
            locationManager.delegate = self
            locationManager.requestWhenInUseAuthorization()
        default:
            self.completionHandler()
        }
    }
    
    // MARK: - Init
    
    static var shared: LocationWhenInUseHandler?
    
    override init() {
        super.init()
    }
    
    deinit {
        locationManager.delegate = nil
    }
}

extension LocationWhenInUseHandler: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .notDetermined {
            return
        }
        completionHandler()
    }
}
