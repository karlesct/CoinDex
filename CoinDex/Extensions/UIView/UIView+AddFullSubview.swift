//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

extension UIView {

    func addFullSubview(_ subview: UIView) {

        self.addSubview(subview)

        subview.translatesAutoresizingMaskIntoConstraints = false

        let bindings: [String: Any] = ["view": subview]

        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|",
                                                           options: [],
                                                           metrics: nil,
                                                           views: bindings))

        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|",
                                                           options: [],
                                                           metrics: nil,
                                                           views: bindings))
    }

}

