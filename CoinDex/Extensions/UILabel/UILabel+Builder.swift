//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

extension UILabel {
    
    class Builder {
        private var text: String?
        private var font: UIFont?
        private var textColor: UIColor?
        private var numberOfLines: Int?
        private var textAlignment: NSTextAlignment?
        
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
        func with(textAlignment: NSTextAlignment?) -> Builder {
            self.textAlignment = textAlignment
            return self
        }
    
        @discardableResult
        func with(numberOfLines: Int?) -> Builder {
            self.numberOfLines = numberOfLines
            return self
        }
        
        func build() -> UILabel {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = self.text
            label.font = self.font ?? .systemFont(ofSize: 17)
            label.textColor = self.textColor ?? .x555555
            label.textAlignment = self.textAlignment ?? .natural
            label.numberOfLines = self.numberOfLines ?? 1
            return label

        }
    }
}
