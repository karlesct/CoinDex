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

        func with(preferredStyle: UIAlertController.Style) -> Builder {
            self.preferredStyle = preferredStyle
            return self
        }

        func with(title: String?) -> Builder {
            self.title = title
            return self
        }

        func with(message: String?) -> Builder {
            self.message = message
            return self
        }

        func with(alertActions: [UIAlertAction]) -> Builder {
            self.alertActions = alertActions
            return self
        }

        func with(sourceView: UIView?) -> Builder {
            self.sourceView = sourceView
            return self
        }

        func with(sourceRect: CGRect?) -> Builder {
            self.sourceRect = sourceRect
            return self
        }

        func with(permittedArrowDirections: UIPopoverArrowDirection?) -> Builder {
            self.permittedArrowDirections = permittedArrowDirections
            return self
        }

        func addAction(title: String,
                       alertActionStyle: UIAlertAction.Style = .default,
                       handler: ((UIAlertAction) -> Void)? = nil) -> Builder {
            let action = UIAlertAction(title: title, style: alertActionStyle, handler: handler)
            self.alertActions.append(action)
            return self
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
