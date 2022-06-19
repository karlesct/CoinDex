//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

class LaunchScreenViewController: UIViewController {

    // MARK: - IBoutlets

    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            self.imageView.image = .launch.logo
        }
    }
    
    @IBOutlet weak var label: UILabel!{
        didSet {
            self.label.text = "launch_title".localized
            self.label.textColor = .primary
            self.label.font = .boldSystemFont(ofSize: 18)
        }
    }
    
    
    // MARK: - Properties

    var viewModel: LaunchScreenViewModelProtocol?
    var navigator: LaunchScreenNavigator?

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        self.navigator?.navigate(to: .coinListMaster)
    }

    // MARK: - Methods

}
