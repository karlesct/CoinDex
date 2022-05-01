//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit
import MapKit

class FuelMapViewController: UIViewController {

    // MARK: - IBoutlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView! {
        didSet {
            self.activityIndicator.hidesWhenStopped = true
            self.activityIndicator.style = .large
            self.activityIndicator.color = .primary
        }
    }
    
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: - Constants

    // MARK: - Properties

    var viewModel: FuelMapViewModelProtocol?
    
    private var locationManager = CLLocationManager() {
        didSet {
            self.locationManager.delegate = self
        }
    }
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewModel?.view = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.viewModel?.viewWillAppear()
        
        PermissionsProvider.request(permission: .locationWhenInUse) { [weak self] result in
            NSLog("PermissionsProvider result: \(result)")
            switch result {
            case true:
                self?.locationManager.setAccuracy(.best)
            case false:
                PermissionsProvider.request(permission: .locationWhenInUse) { result in
                    
                }
            }
        }
    }


    // MARK: - Methods

}

extension FuelMapViewController: FuelMapViewProtocol {
    func setLoading(loading: Bool) {
        DispatchQueue.main.async {
            loading ? self.activityIndicator.startAnimating() : self.activityIndicator.stopAnimating()
        }
    }
}

extension FuelMapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard Permission.locationWhenInUse.authorized else {
            // Here we must tell user how to turn on location on device
            return
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       
    }
}
