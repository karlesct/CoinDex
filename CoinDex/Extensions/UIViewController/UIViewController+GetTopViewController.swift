//
//  Copyright © 2021 CCT. All rights reserved.
//


import UIKit

extension UIViewController {

    var getTopViewController: UIViewController? {
        let appDelegate = UIApplication.shared.delegate
        if let window = appDelegate?.window {
            return window?.visibleViewController
        }
        return nil
    }

}
