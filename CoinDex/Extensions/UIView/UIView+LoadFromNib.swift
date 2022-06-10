//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

extension UIView {

    static func loadFromNib() -> Self? {
        func instantiateFromNib<T: UIView>() -> T? {
            guard let contentView = Bundle(for: T.self).loadNibNamed(String(describing: type(of: self)),
                                                                     owner: self,
                                                                     options: nil)?.first as? T else {
                return nil
            }
            return contentView
        }

        return instantiateFromNib()
    }
}

extension UIView {
    
    static var nib: UINib {
        return UINib(nibName: "\(self)", bundle: nil)
    }
    
    static func instantiateFromNib() -> Self? {
        return nib.instantiate() as? Self
    }
}

extension UINib {
    func instantiate() -> Any? {
        return instantiate(withOwner: nil, options: nil).first
    }
}
