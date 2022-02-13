//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

extension UIColor {
    static let x000000 = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    static let x555555 = #colorLiteral(red: 0.3333333333, green: 0.3333333333, blue: 0.3333333333, alpha: 1)
    static let x999999 = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
    static let xE2E2E2 = #colorLiteral(red: 0.8862745098, green: 0.8862745098, blue: 0.8862745098, alpha: 1)
    static let xFFFFFF = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    static let x00BBF7 = #colorLiteral(red: 0, green: 0.7333333333, blue: 0.968627451, alpha: 1)
    static let xFCE224 = #colorLiteral(red: 0.9882352941, green: 0.8862745098, blue: 0.1411764706, alpha: 1)
    static let x88B14B = #colorLiteral(red: 0.5333333333, green: 0.6941176471, blue: 0.2941176471, alpha: 1)


    static var primaryColor: UIColor {
        return UIColor.dynamicColor(light: .x88B14B,
                                    dark: .x88B14B)
    }

    static var secondaryColor: UIColor {
        return UIColor.dynamicColor(light: .xFCE224,
                                    dark: .xFCE224)
    }

    static var defaultTextColor: UIColor {
        return UIColor.dynamicColor(light: .x555555,
                                    dark: .xFFFFFF)
    }
}
