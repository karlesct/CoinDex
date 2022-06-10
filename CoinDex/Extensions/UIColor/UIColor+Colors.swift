//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

extension UIColor {
    
    static let x000000 = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    static let x333333 = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
    static let x555555 = #colorLiteral(red: 0.3333333333, green: 0.3333333333, blue: 0.3333333333, alpha: 1)
    static let x858585 = #colorLiteral(red: 0.5215686275, green: 0.5215686275, blue: 0.5215686275, alpha: 1)
    static let x999999 = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
    static let xC4C4C4 = #colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 1)
    static let xCACACA = #colorLiteral(red: 0.7921568627, green: 0.7921568627, blue: 0.7921568627, alpha: 1)
    static let xE8E7E3 = #colorLiteral(red: 0.9098039216, green: 0.9058823529, blue: 0.8901960784, alpha: 1)
    static let xE6E6E6 = #colorLiteral(red: 0.9019607843, green: 0.9019607843, blue: 0.9019607843, alpha: 1)
    static let xE2E2E2 = #colorLiteral(red: 0.8862745098, green: 0.8862745098, blue: 0.8862745098, alpha: 1)
    static let xF2F2F2 = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
    static let xF5F5F5 = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
    static let xF6F6F6 = #colorLiteral(red: 0.9719485641, green: 0.9719484448, blue: 0.9719484448, alpha: 1)
    static let xFFFFFF = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    static let x00A9CE = #colorLiteral(red: 0, green: 0.662745098, blue: 0.8078431373, alpha: 1)
    static let x00BBF7 = #colorLiteral(red: 0, green: 0.7333333333, blue: 0.968627451, alpha: 1)
    static let x1AD179 = #colorLiteral(red: 0.1019607843, green: 0.8196078431, blue: 0.4745098039, alpha: 1)
    static let x69EF00 = #colorLiteral(red: 0.4117647059, green: 0.937254902, blue: 0, alpha: 1)
    static let x88B14B = #colorLiteral(red: 0.5333333333, green: 0.6941176471, blue: 0.2941176471, alpha: 1)
    static let xFEF5A0 = #colorLiteral(red: 0.9960784314, green: 0.9607843137, blue: 0.6274509804, alpha: 1)
    static let xFCE224 = #colorLiteral(red: 0.9882352941, green: 0.8862745098, blue: 0.1411764706, alpha: 1)
    static let xFFC700 = #colorLiteral(red: 1, green: 0.7803921569, blue: 0, alpha: 1)
    static let xFF6464 = #colorLiteral(red: 1, green: 0.3921568627, blue: 0.3921568627, alpha: 1)
    static let xEF0000 = #colorLiteral(red: 0.937254902, green: 0, blue: 0, alpha: 1)
    static let x9655FF = #colorLiteral(red: 0.5882352941, green: 0.3333333333, blue: 1, alpha: 1)
    static let x52519B = #colorLiteral(red: 0.3215686275, green: 0.3176470588, blue: 0.6078431373, alpha: 1)
    static let x35348A = #colorLiteral(red: 0.2078431373, green: 0.2039215686, blue: 0.5411764706, alpha: 1)
    static let x00FFFFFF = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) // 0% alpha
    static let x80000000 = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
    static let x8000BBF7 = #colorLiteral(red: 0, green: 0.7333333333, blue: 0.968627451, alpha: 0.5) // 50% alpha
    
    
    static var primary: UIColor {
        return UIColor.dynamicColor(light: .x88B14B,
                                    dark: .x88B14B)
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
