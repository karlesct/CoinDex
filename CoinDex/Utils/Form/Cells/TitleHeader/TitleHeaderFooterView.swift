//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class TitleHeaderFooterView: UITableViewHeaderFooterView,
                                   NibLoadable,
                                   ReusableCell {

    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            self.titleLabel.textColor = .systemGray
            self.titleLabel.font = UIFont.systemFont(ofSize: 12.0)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(with item: TitleHeaderFooterModel) {
        titleLabel.text = item.title
    }
}

// MARK: - Private helper
extension TitleHeaderFooterView {}
