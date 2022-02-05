//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class SelectInputTableViewCell: UITableViewCell, NibLoadable, ReusableCell {

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

    func configure(_ viewModel: SelectInputViewModel) {
        titleLabel.text = viewModel.title
        valueLabel.text = viewModel.value
    }
}
