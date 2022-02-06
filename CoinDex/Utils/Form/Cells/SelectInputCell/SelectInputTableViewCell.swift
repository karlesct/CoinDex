//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class SelectInputTableViewCell: UITableViewCell,
                                      NibLoadable,
                                      ReusableCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        accessoryType = .disclosureIndicator
    }
}

// MARK: - Configure
extension SelectInputTableViewCell {

    func configure(with item: SelectInputCellModel) {
        titleLabel.text = item.title
        valueLabel.text = item.value
    }
}
