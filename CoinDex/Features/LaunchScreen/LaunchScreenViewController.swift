//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

class LaunchScreenViewController: UIViewController {

    // MARK: - IBoutlets


    // MARK: - Properties

    var viewModel: LaunchScreenViewModelProtocol?
    var navigator: LaunchScreenNavigator?

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        self.navigator?.navigate(to: .main)
    }

    // MARK: - Methods

}
