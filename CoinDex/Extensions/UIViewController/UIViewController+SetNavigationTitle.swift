//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

extension UIViewController {
    func setNavigation(image: UIImage,
                       title: String,
                       color: UIColor) {
        
        let imageView = UIImageView.Builder()
            .with(image: image)
            .with(tintColor: color)
            .with(width: 24)
            .with(height: 24)
            .build()
        
        let label = UILabel.Builder()
            .with(text: title)
            .with(textColor: color)
            .with(font: .systemFont(ofSize: 18))
            .build()
        
        let stackView = UIStackView.Builder()
            .with(axis: .horizontal)
            .with(alignment: .center)
            .with(spacing: 10)
            .with(arrangedSubviews: [
                imageView,
                label
            ])
            .build()
        
        self.navigationItem.titleView = stackView
        
    }
}
