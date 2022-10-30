//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit
import MapKit
import Combine
import CoreLocation

class MapsViewController: UIViewController {
    
    // MARK: - IBoutlets
    
    @IBOutlet weak var mkMapView: MKMapView! {
        didSet {
            self.mkMapView.delegate = self
        }
    }
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView! {
        didSet {
            self.activityIndicator.hidesWhenStopped = true
            self.activityIndicator.style = .large
            self.activityIndicator.color = .primary
        }
    }
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var button: UIButton! {
        didSet {
            self.button.setBackgroundColor(color: .xFFFFFF,
                                           for: .normal)
            self.button.addTarget(self,
                                  action: #selector(self.buttonAction),
                                  for: .touchUpInside)
        }
    }
    
    @IBOutlet weak var button1: UIButton! {
        didSet {
            self.button1.setBackgroundColor(color: .x555555,
                                            for: .normal)
            self.button1.addTarget(self,
                                   action: #selector(self.button1Action),
                                   for: .touchUpInside)
        }
    }
    
    // MARK: - Properties
    
    var viewModel: MapsViewModelProtocol?
    
    private var subscriptions: Set<AnyCancellable> = []
    
    lazy var locationManager: CLLocationManager = {
        var manager = CLLocationManager()
        manager.delegate = self
        return manager
    }()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupBindings()
        self.setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        PermissionsProvider.request(permission: .locationWhenInUse) { [weak self] result in
            NSLog("PermissionsProvider result: \(result)")
            switch result {
            case true:
                self?.locationManager.setAccuracy(.best)
                self?.locationManager.distanceFilter = 10
            case false:
                PermissionsProvider.request(permission: .locationWhenInUse) { result in
                    
                }
            }
        }
    }
    
    
    // MARK: - Methods
    
    func setupUI() {
        self.setNavigation(image: .tabBar.exchangesIcon,
                           title: self.viewModel?.title ?? .empty,
                           color: .xFFFFFF)
        
        self.view.backgroundColor = .xF6F6F6
    }
    
    func setupBindings() {
        self.viewModel?.isLoadingPublisher
            .assign(to: \.isLoading,
                    on: self)
            .store(in: &subscriptions)
    }
    
    var isLoading: Bool = false {
        didSet {
            DispatchQueue.main.async {
                self.isLoading
                ? self.activityIndicator.startAnimating()
                : self.activityIndicator.stopAnimating()
            }
        }
    }
    
    func updateLocationOnMap(location: CLLocation?,
                             title: String?) {
        
        guard let location = location else {
            return
        }
        
        let point = MKPointAnnotation()
        point.title = title
        point.coordinate = location.coordinate
        self.mkMapView.removeAnnotations(self.mkMapView.annotations)
        self.mkMapView.addAnnotation(point)
        
        let viewRegion = MKCoordinateRegion(center: location.coordinate,
                                            latitudinalMeters: 200,
                                            longitudinalMeters: 200)
        self.mkMapView.setRegion(viewRegion,
                                 animated: true)
    }
    
    
    @objc func buttonAction() {
        
        guard let currentLocation = self.locationManager.location
        else { return }
        
        currentLocation.lookUpLocationName { (name) in
            self.updateLocationOnMap(location: currentLocation,
                                     title: name)
        }
        
        let sourceLocation = CLLocationCoordinate2D(latitude: currentLocation.coordinate.latitude,
                                                    longitude: currentLocation.coordinate.longitude)
        let destinationLocation = CLLocationCoordinate2D(latitude: 41.421144659849055,
                                                         longitude: 2.1895417978422245)
        
        self.mkMapView.showRouteOnMap(pickupCoordinate: sourceLocation,
                                      destinationCoordinate: destinationLocation)
    }
    
    @objc func button1Action() {
        
        guard let text = textField.text
        else { return }
        
        
        self.updatePlaceMark(address: text)
        
        
        
        
    }
    
    func updatePlaceMark(address: String) {
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(address) { (placemarks, error) in
            guard
                let placemark = placemarks?.first,
                let location = placemark.location
            else { return }
            
            self.updateLocationOnMap(location: location,
                                     title: placemark.stringValue)
        }
    }
}

extension MapsViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard Permission.locationWhenInUse.authorized else {
            // Here we must tell user how to turn on location on device
            return
        }
        
        self.locationManager.startUpdatingLocation()
    }
    
    
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first
        else { return }
        
        location.lookUpLocationName { (name) in
            self.updateLocationOnMap(location: location,
                                     title: name)
        }
    }
}

extension MapsViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = .primary
        renderer.lineWidth = 4.0
        return renderer
    }
}

extension CLLocation {
    
    func lookUpLocationName(_ handler: @escaping (String?) -> Void) {
        
        self.lookUpPlaceMark { (placemark) in
            handler(placemark?.stringValue)
        }
    }
    
    func lookUpPlaceMark(_ handler: @escaping (CLPlacemark?) -> Void) {
        
        let geocoder = CLGeocoder()
        
        // Look up the location and pass it to the completion handler
        geocoder.reverseGeocodeLocation(self) { (placemarks, error) in
            if error == nil {
                let firstLocation = placemarks?[0]
                handler(firstLocation)
            }
            else {
                // An error occurred during geocoding.
                handler(nil)
            }
        }
    }
}

extension CLPlacemark {
    var stringValue: String {
        return "\(thoroughfare ?? "") \(postalCode ?? "")"
    }
}


extension MKMapView {
    
    func showRouteOnMap(pickupCoordinate: CLLocationCoordinate2D, destinationCoordinate: CLLocationCoordinate2D) {
        let sourcePlacemark = MKPlacemark(coordinate: pickupCoordinate, addressDictionary: nil)
        let destinationPlacemark = MKPlacemark(coordinate: destinationCoordinate, addressDictionary: nil)
        
        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
        
        let sourceAnnotation = MKPointAnnotation()
        
        if let location = sourcePlacemark.location {
            sourceAnnotation.coordinate = location.coordinate
        }
        
        let destinationAnnotation = MKPointAnnotation()
        
        if let location = destinationPlacemark.location {
            destinationAnnotation.coordinate = location.coordinate
        }
        
        self.showAnnotations([sourceAnnotation,destinationAnnotation], animated: true )
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .automobile
        // Calculate the direction
        let directions = MKDirections(request: directionRequest)
        
        directions.calculate {
            (response, error) -> Void in
            
            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }
                
                return
            }
            let route = response.routes[0]
            self.addOverlay((route.polyline), level: MKOverlayLevel.aboveRoads)
            let rect = route.polyline.boundingMapRect
            self.setRegion(MKCoordinateRegion(rect), animated: true)
        }
    }}
