//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class AppDelegateAssembler {

    private(set) lazy var window = UIWindow(frame: UIScreen.main.bounds)
    private(set) lazy var launchScreenAssembler = LaunchScreenAssembler(navigationController: navigationController)
    private(set) lazy var navigationController: UINavigationController = {
        return UINavigationController()
    }()

    // MARK: - Init

    init() {

    }

    // MARK: - Methods

}
