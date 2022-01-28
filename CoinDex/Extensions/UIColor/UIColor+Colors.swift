//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

extension UIColor {
    static let x555555 = #colorLiteral(red: 0.3333333333, green: 0.3333333333, blue: 0.3333333333, alpha: 1)
    static let xE2E2E2 = #colorLiteral(red: 0.8862745098, green: 0.8862745098, blue: 0.8862745098, alpha: 1)
    static let xFFFFFF = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    static let x00BBF7 = #colorLiteral(red: 0, green: 0.7333333333, blue: 0.968627451, alpha: 1)


    static var primaryColor: UIColor {
        return UIColor.dynamicColor(light: .x00BBF7,
                                    dark: .x00BBF7)
    }

    static var defaultTextColor: UIColor {
        return UIColor.dynamicColor(light: .x555555,
                                    dark: .xFFFFFF)
    }
}
