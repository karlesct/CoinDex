//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

extension UIView {

    func addFullSubview(view: UIView?) {

        guard let view = view else { return }

        self.addSubview(view)

        view.translatesAutoresizingMaskIntoConstraints = false

        let bindings: [String: Any] = ["view": view]

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

