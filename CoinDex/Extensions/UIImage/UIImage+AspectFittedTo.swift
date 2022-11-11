//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

extension UIImage {
    /// Given a required height, returns a (rasterised) copy
    /// of the image, aspect-fitted to that height.

    func aspectFittedTo(height: CGFloat) -> UIImage {
        let scale = height / self.size.height
        let newWidth = self.size.width * scale
        let newSize = CGSize(width: newWidth, height: height)
        let renderer = UIGraphicsImageRenderer(size: newSize)

        return renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: newSize))
        }
    }
}
