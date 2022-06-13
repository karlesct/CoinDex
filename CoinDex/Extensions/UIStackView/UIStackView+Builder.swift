//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation
import UIKit

extension UIStackView {
    
    class Builder {
        private var axis: NSLayoutConstraint.Axis?
        private var distribution: UIStackView.Distribution?
        private var alignment: UIStackView.Alignment?
        private var spacing: CGFloat?
        private var arrangedSubviews: [UIView] = []
        
        // MARK: - Init

        init() {
        }

        // MARK: - Methods
        
        @discardableResult
        func with(axis: NSLayoutConstraint.Axis?) -> Builder {
            self.axis = axis
            return self
        }
        
        @discardableResult
        func with(distribution: UIStackView.Distribution?) -> Builder {
            self.distribution = distribution
            return self
        }
        
        @discardableResult
        func with(alignment: UIStackView.Alignment?) -> Builder {
            self.alignment = alignment
            return self
        }
        
        @discardableResult
        func with(spacing: CGFloat?) -> Builder {
            self.spacing = spacing
            return self
        }
    
        @discardableResult
        func with(arrangedSubview: UIView) -> Builder {
            self.arrangedSubviews.append(arrangedSubview)
            return self
        }
        
        func build() -> UIStackView {
            let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = self.axis ?? .vertical
            stackView.distribution = self.distribution ?? .fill
            stackView.alignment = self.alignment ?? .fill
            stackView.spacing = self.spacing ?? 0
            
            
            self.arrangedSubviews.forEach {
                stackView.addArrangedSubview($0)
            }
            
            return stackView

        }
    }
}
