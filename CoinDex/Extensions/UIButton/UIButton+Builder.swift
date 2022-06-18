//
//  Copyright © 2022 CCT. All rights reserved.
//

import UIKit

extension UIButton {
    struct ButtonAction {
        var target: Any?
        var selector: Selector
        var controlEvent: UIControl.Event
    }

    class Builder {
        private var text: String?
        private var font: UIFont?
        private var textColor: UIColor?
        private var buttonActions: [ButtonAction] = []
        private var backgroundColor: UIColor?
        private var height: CGFloat?
        private var cornerRadius: CGFloat?

        private var topInset: CGFloat?
        private var leftInset: CGFloat?
        private var bottomInset: CGFloat?
        private var rightInset: CGFloat?

        // MARK: - Init

        init() {}

        // MARK: - Methods

        @discardableResult
        func with(text: String?) -> Builder {
            self.text = text
            return self
        }

        @discardableResult
        func with(font: UIFont?) -> Builder {
            self.font = font
            return self
        }

        @discardableResult
        func with(textColor: UIColor?) -> Builder {
            self.textColor = textColor
            return self
        }

        @discardableResult
        func with(backgroundColor: UIColor?) -> Builder {
            self.backgroundColor = backgroundColor
            return self
        }

        @discardableResult
        func with(height: CGFloat?) -> Builder {
            self.height = height
            return self
        }

        @discardableResult
        func with(cornerRadius: CGFloat?) -> Builder {
            self.cornerRadius = cornerRadius
            return self
        }

        @discardableResult
        func with(topInset: CGFloat?) -> Builder {
            self.topInset = topInset
            return self
        }

        @discardableResult
        func with(leftInset: CGFloat?) -> Builder {
            self.leftInset = leftInset
            return self
        }

        @discardableResult
        func with(bottomInset: CGFloat?) -> Builder {
            self.bottomInset = bottomInset
            return self
        }

        @discardableResult
        func with(rightInset: CGFloat?) -> Builder {
            self.rightInset = rightInset
            return self
        }

        @discardableResult
        func with(target: Any?,
                  selector: Selector,
                  controlEvent: UIControl.Event) -> Builder {
            let buttonAction = ButtonAction(target: target,
                                            selector: selector,
                                            controlEvent: controlEvent)
            self.buttonActions.append(buttonAction)
            return self
        }

        @discardableResult
        func with(buttonAction: ButtonAction) -> Builder {
            self.buttonActions.append(buttonAction)
            return self
        }

        func build() -> UIButton {
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(self.text,
                            for: .normal)
            button.setTitleColor(self.textColor ?? .x555555,
                                 for: .normal)
            button.setBackgroundColor(color: self.backgroundColor ?? .primary,
                                      for: .normal)
            button.titleLabel?.font = self.font
            buttonActions.forEach {
                button.addTarget($0.target,
                                 action: $0.selector,
                                 for: $0.controlEvent)
            }

            button.layer.cornerRadius = self.cornerRadius ?? 5
            button.contentEdgeInsets = UIEdgeInsets(top: self.topInset ?? 0,
                                                    left: self.leftInset ?? 0,
                                                    bottom: self.bottomInset ?? 0,
                                                    right: self.rightInset ?? 0)

            guard let height = self.height else {
                return button
            }

            button.heightAnchor.constraint(equalToConstant: height)
                .isActive = true
            return button
        }
    }
}
