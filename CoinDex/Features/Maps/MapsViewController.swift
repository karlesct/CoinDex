//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit
import MapKit
import Combine

class MapsViewController: UIViewController {
    
    // MARK: - IBoutlets
    
    @IBOutlet weak var mkMapView: MKMapView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView! {
        didSet {
            self.activityIndicator.hidesWhenStopped = true
            self.activityIndicator.style = .large
            self.activityIndicator.color = .primary
        }
    }
    
    // MARK: - Properties
    
    var viewModel: MapsViewModelProtocol?
    
    private var subscriptions: Set<AnyCancellable> = []
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupBindings()
        self.setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
    
}

