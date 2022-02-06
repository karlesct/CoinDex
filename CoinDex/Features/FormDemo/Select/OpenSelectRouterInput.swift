//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

protocol OpenSelectRouterInput: AnyObject {

    var viewController: UIViewController? { get }

    func showSelectScreen(output: SelectModuleOutput?)
}

extension OpenSelectRouterInput {

    func showSelectScreen(output: SelectModuleOutput?) {
        let module = SelectModule()
        module.output = output
        viewController?.present(module.view, animated: true)
    }
}
