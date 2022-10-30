//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit
import Combine

class MainMasterViewController: UIViewController {
    
    // MARK: - IBoutlets
    
    @IBOutlet weak var contactAction: UIButton! {
        didSet {
            self.contactAction.setTitle("Contact Action",
                                         for: .normal)
            self.contactAction.addTarget(self,
                                          action: #selector(self.contacAction),
                                          for: .touchUpInside)

        }
    }
    
    // MARK: - Properties
    
    var viewModel: MainMasterViewModelProtocol?
    var navigator: MainMasterNavigator?
    
    private var subscriptions: Set<AnyCancellable> = []
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
    }
    
    // MARK: - Methods
    
    func setupUI() {
        self.setNavigation(image: .tabBar.exchangesIcon,
                           title: self.viewModel?.title ?? .empty,
                           color: .xFFFFFF)
        
        self.view.backgroundColor = .xF6F6F6
    }
    
    
    @objc func contacAction() {
        
    }

}

