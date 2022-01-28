//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

extension UIButton {

    func setBackgroundColor(color: UIColor,
                            for forState: UIControl.State) {

        UIGraphicsBeginImageContext(CGSize(width: 1,
                                           height: 1))

        let context = UIGraphicsGetCurrentContext()

        context?.setFillColor(color.cgColor)
        context?.fill(CGRect(x: 0,
                             y: 0,
                             width: 1,
                             height: 1))

        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.clipsToBounds = true
        self.setBackgroundImage(colorImage,
                                for: forState)
    }

}
