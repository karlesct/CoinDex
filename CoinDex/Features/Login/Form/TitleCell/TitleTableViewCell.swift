//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class TitleTableViewCell: UITableViewCell,
                                    NibLoadable,
                                    ReusableCell {


    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            self.titleLabel.textColor = .x555555
            self.titleLabel.font = .boldSystemFont(ofSize: 28)
            self.titleLabel.numberOfLines = 0
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
}

// MARK: - Configure
extension TitleTableViewCell {

    func configure(with item: TitleCellModel) {
        self.titleLabel.text = item.title
    }
}

