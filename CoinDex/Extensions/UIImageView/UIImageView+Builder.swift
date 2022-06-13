//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation
import UIKit

extension UIImageView {
    
    class Builder {
        private var imageName: String?
        private var height: CGFloat?
        private var width: CGFloat?
        
        // MARK: - Init

        init() {
        }

        // MARK: - Methods
        
        @discardableResult
        func with(imageName: String?) -> Builder {
            self.imageName = imageName
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
            imageView.image = UIImage(named: self.imageName ?? .empty)
            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
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
