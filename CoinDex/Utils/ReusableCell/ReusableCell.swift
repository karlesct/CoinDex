//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

public protocol ReusableCell: AnyObject {
    static var reuseIdentifier: String { get }
}

public extension ReusableCell where Self: UITableViewCell {

    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

public extension ReusableCell where Self: UICollectionViewCell {

    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

