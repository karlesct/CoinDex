//
//  Copyright © 2022 CCT. All rights reserved.
//

import UIKit

final class AppDelegateAssembler {

    private(set) lazy var window = UIWindow(frame: UIScreen.main.bounds)
    private(set) lazy var launchScreenAssembler = LaunchScreenAssembler(navigationController: navigationController)
    private(set) lazy var navigationController: UINavigationController = {
        return CustomNavigationController()
    }()

    // MARK: - Init

    init() {

    }

    // MARK: - Methods
    
    func compositeAppDelegate() -> AppDelegateType {
        return CompositeAppDelegate(appDelegates: [
            self.firebaseAppDelegate()
        ])
    }
    
    private func firebaseAppDelegate() -> AppDelegateType? {
        let assembler = FirebaseAppDelegateAssembler()
        return assembler.delegate()
    }
}
