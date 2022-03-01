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

        func withPreferredStyle(_ preferredStyle: UIAlertController.Style) -> Builder {
            self.preferredStyle = preferredStyle
            return self
        }

        func withTitle(_ title: String?) -> Builder {
            self.title = title
            return self
        }

        func withMessage(_ message: String?) -> Builder {
            self.message = message
            return self
        }

        func withAlertActions(_ alertActions: [UIAlertAction]) -> Builder {
            self.alertActions = alertActions
            return self
        }

        func withSourceView(_ sourceView: UIView?) -> Builder {
            self.sourceView = sourceView
            return self
        }

        func withSourceRect(_ sourceRect: CGRect?) -> Builder {
            self.sourceRect = sourceRect
            return self
        }

        func withpermittedArrowDirections(_ permittedArrowDirections: UIPopoverArrowDirection?) -> Builder {
            self.permittedArrowDirections = permittedArrowDirections
            return self
        }

        func addActionWithTitle(_ title: String,
                                alertActionStyle: UIAlertAction.Style = .default,
                                handler: ((UIAlertAction) -> Void)? = nil) -> Builder {
            let action = UIAlertAction(title: title, style: alertActionStyle, handler: handler)
            self.alertActions.append(action)
            return self
        }

        func showIn(_ viewController: UIViewController,
                    animater: Bool = true,
                    completion: (() -> Void)? = nil) {

            viewController.present(build(),
                                   animated: animater,
                                   completion: completion)
        }

        func show(animater: Bool = true, completion: (() -> Void)? = nil) {
            DispatchQueue.main.async {
                guard let viewController = UIViewController().getTopViewController else { return }
                viewController.present(self.build(),
                                       animated: true,
                                       completion: nil)
            }
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
