//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

protocol TextInputCellDelegate: AnyObject {

    func cell(_ cell: TextInputTableViewCell,
              didChangeValue value: String?)
}

final class TextInputTableViewCell: UITableViewCell,
                                    NibLoadable,
                                    ReusableCell {


    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField! {
        didSet {
            self.textField.textAlignment = .right
            self.textField.addTarget(self,
                                action: #selector(textFieldEditingChanged),
                                for: .editingChanged)
        }
    }

    weak var delegate: TextInputCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    @objc private func textFieldEditingChanged(_ textField: UITextField) {
        delegate?.cell(self,
                       didChangeValue: textField.text)
    }
}

// MARK: - Configure
extension TextInputTableViewCell {

    func configure(with item: TextInputCellModel) {
        titleLabel.text = item.title

        textField.placeholder = item.title
        textField.text = item.value
        textField.isSecureTextEntry = item.isSecure

    }
}
