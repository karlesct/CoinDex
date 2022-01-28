//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

extension UIColor {
    static func dynamicColor(light: UIColor,
                             dark: UIColor) -> UIColor {
        guard #available(iOS 13.0, *) else { return light }
        return UIColor { $0.userInterfaceStyle == .dark ? dark : light }
    }
}
