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
    
    static var primary: UIColor {
        return UIColor.dynamicColor(light: .x8CC33C,
                                    dark: .x8CC33C)
    }

    static var secondary: UIColor {
        return UIColor.dynamicColor(light: .xFCE224,
                                    dark: .xFCE224)
    }

    static var defaultText: UIColor {
        return UIColor.dynamicColor(light: .x555555,
                                    dark: .xFFFFFF)
    }
}
