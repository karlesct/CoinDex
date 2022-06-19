//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation
import UIKit

extension UIImageView {
    
    class Builder {
        private var image: UIImage?
        private var tintColor: UIColor?
        private var height: CGFloat?
        private var width: CGFloat?
        
        // MARK: - Init

        init() {
        }

        // MARK: - Methods
        
        @discardableResult
        func with(image: UIImage?) -> Builder {
            self.image = image
            return self
        }
        
        @discardableResult
        func with(tintColor: UIColor?) -> Builder {
            self.tintColor = tintColor
            return self
        }
        
        @discardableResult
        func with(height: CGFloat?) -> Builder {
            self.height = height
            return self
        }
        
        @discardableResult
        func with(width: CGFloat?) -> Builder {
            self.width = width
            return self
        }
        
        func build() -> UIImageView {
            let imageView = UIImageView()
            imageView.image = self.image
            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            imageView.tintColor = self.tintColor
            
            guard let height = self.height,
                  let width = self.width else {
                return imageView
            }
            
            imageView.heightAnchor.constraint(equalToConstant: height).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: width).isActive = true
            
            return imageView

        }
    }
}
