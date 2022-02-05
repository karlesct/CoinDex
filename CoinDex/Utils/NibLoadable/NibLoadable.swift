//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

import UIKit

public protocol NibLoadable: AnyObject {
    static var nibName: String { get }
    static func instantiate() -> Self
}

public extension NibLoadable where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }

    static func instantiate() -> Self {
        if let nib = UINib(nibName: nibName,
                           bundle: Bundle(for: Self.self))
                    .instantiate(withOwner: nil, options: nil)[0] as? Self {
            return nib
        } else {
            fatalError("Failed to load .xib named \(nibName) in bundle \(Bundle(for: Self.self))")
        }
    }
}
