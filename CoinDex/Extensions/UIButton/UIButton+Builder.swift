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
        
        
        // MARK: - Init

        init() {
        }

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
        func with(target: Any?,
                  selector: Selector,
                  controlEvent: UIControl.Event) -> Builder {
            let buttonAction = ButtonAction(target: target,
                                            selector: selector,
                                            controlEvent: controlEvent)
            self.buttonActions.append(buttonAction)
            return self
        }
        
        func build() -> UIButton {
            let button = UIButton(type: .system)
            button
                .setTitle(self.text,
                          for: .normal)
            button
                .setTitleColor(self.textColor ?? .primary,
                               for: .normal)
            button.titleLabel?.font = self.font
            
            buttonActions.forEach {
                button.addTarget($0.target,
                                 action: $0.selector,
                                 for: $0.controlEvent)
            }
            
            button.translatesAutoresizingMaskIntoConstraints = false
            
            return button

        }
    }
}
