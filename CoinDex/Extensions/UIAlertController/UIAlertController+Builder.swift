//
//  Copyright © 2021 CCT. All rights reserved.
//


import UIKit

extension UIAlertController {

    class Builder {

        // MARK: - Properties

        private var preferredStyle: UIAlertController.Style = .alert
        private var title: String?
        private var message: String?
        private var alertActions: [UIAlertAction] = [UIAlertAction]()
        private var sourceView: UIView?
        private var sourceRect: CGRect?
        private var permittedArrowDirections: UIPopoverArrowDirection?

        // MARK: - Init

        init() {
        }

        // MARK: - Methods

        func preferredStyle(_ preferredStyle: UIAlertController.Style) -> Builder {

            self.preferredStyle = preferredStyle
            return self
        }

        func title(_ title: String?) -> Builder {

            self.title = title
            return self
        }

        func message(_ message: String?) -> Builder {

            self.message = message
            return self
        }

        func alertActions(_ alertActions: [UIAlertAction]) -> Builder {

            self.alertActions = alertActions
            return self
        }

        func sourceView(_ sourceView: UIView?) -> Builder {

            self.sourceView = sourceView
            return self
        }

        func sourceRect(_ sourceRect: CGRect?) -> Builder {

            self.sourceRect = sourceRect
            return self
        }

        func permittedArrowDirections(_ permittedArrowDirections: UIPopoverArrowDirection?) -> Builder {

            self.permittedArrowDirections = permittedArrowDirections
            return self
        }


        func showIn(_ viewController: UIViewController,
                    animater: Bool = true,
                    completion: (() -> Void)? = nil) {

            viewController.present(build(),
                                   animated: animater,
                                   completion: completion)
        }

        func build() -> UIAlertController {

            let alertController = UIAlertController(title: self.title,
                                                    message: self.message,
                                                    preferredStyle: self.preferredStyle)

            if let sourceView = self.sourceView {
                alertController.popoverPresentationController?.sourceView = sourceView
            }

            if let sourceRect = self.sourceRect {
                alertController.popoverPresentationController?.sourceRect = sourceRect
            }

            if let permittedArrowDirections = self.permittedArrowDirections {
                alertController.popoverPresentationController?.permittedArrowDirections = permittedArrowDirections
            }

            alertActions.forEach { action in
                alertController.addAction(action)
            }

            return alertController

        }

    }

}
