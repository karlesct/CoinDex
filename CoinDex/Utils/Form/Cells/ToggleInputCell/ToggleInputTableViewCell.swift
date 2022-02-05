//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

protocol ToggleInputCellDelegate: AnyObject {

    func cell(_ cell: ToggleInputTableViewCell, didChangeValue value: Bool)
}

final class ToggleInputTableViewCell: UITableViewCell, NibLoadable, ReusableCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueSwitch: UISwitch!

    weak var delegate: ToggleInputCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        commonInit()
    }

    private func commonInit() {

        valueSwitch.addTarget(self, action: #selector(valueSwitchDidChange), for: .valueChanged)
    }

    @objc private func valueSwitchDidChange() {
        delegate?.cell(self, didChangeValue: valueSwitch.isOn)
    }
}

// MARK: - Configure
extension ToggleInputTableViewCell {

    func configure(_ viewModel: ToggleInputViewModel) {
        titleLabel.text = viewModel.title
        valueSwitch.isOn = viewModel.value
    }
}
