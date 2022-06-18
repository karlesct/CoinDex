//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

extension CALayer {
    func setShadow() {
        self.masksToBounds = false
        self.shadowColor = UIColor.x000000.cgColor
        self.shadowOpacity = 0.3
        self.shadowOffset = .zero
    }
}
