//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

protocol FavoriteButtonDelegate: AnyObject {
    func favoriteButton(_ favoriteButton: FavoriteButton,
                        didChangeValue value: Bool)
}

class FavoriteButton: UIButton {
    // MARK: - Properties

    var isChecked: Bool = false {
        didSet {
            self.layer.opacity = self.isChecked ? 1 : 0.3
            self.delegate?.favoriteButton(self,
                                          didChangeValue: self.isChecked)
        }
    }

    weak var delegate: FavoriteButtonDelegate?

    // MARK: - Init - Storyboard

    override func awakeFromNib() {
        self.setup()
        
        self.setTitle(.empty, for: .normal)
        self.setImage(.common.favoriteIcon.aspectFittedTo(height: 40),
                      for: .normal)
    }

    // MARK: - Methods

    private func setup() {
        self.addTarget(self, action: #selector(self.buttonClicked),
                       for: .touchUpInside)

        self.isChecked = false
    }

    @objc func buttonClicked() {
        self.isChecked = !self.isChecked
    }
}
