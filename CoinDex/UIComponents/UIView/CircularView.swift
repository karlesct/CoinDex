//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

class CircularView: UIView {
    override func tintColorDidChange() {
        self.backgroundColor = tintColor
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.updateCornerRadius()
    }

    override var frame: CGRect {
        didSet {
            self.updateCornerRadius()
        }
    }

    private func updateCornerRadius() {
        layer.cornerRadius = min(bounds.width, bounds.height) / 2
    }
}
