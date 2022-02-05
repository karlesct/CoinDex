//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

protocol TextInputCellDelegate: AnyObject {

    func cell(_ cell: TextInputTableViewCell, didChangeValue value: String?)
}

final class TextInputTableViewCell: UITableViewCell, NibLoadable, ReusableCell {


    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!

    weak var delegate: TextInputCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    @objc private func textFieldEditingChanged(_ textField: UITextField) {
        delegate?.cell(self, didChangeValue: textField.text)
    }
}

// MARK: - Configure
extension TextInputTableViewCell {

    func configure(_ viewModel: TextInputViewModel) {
        titleLabel.text = viewModel.title

        textField.placeholder = viewModel.title
        textField.text = viewModel.value
        textField.isSecureTextEntry = viewModel.isSecure
        textField.textAlignment = .right
        textField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
    }
}
