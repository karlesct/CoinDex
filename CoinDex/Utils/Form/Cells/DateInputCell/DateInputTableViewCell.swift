//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

protocol DateInputCellDelegate: AnyObject {

    func cell(_ cell: DateInputTableViewCell,
              didChangeValue value: Date)
}

final class DateInputTableViewCell: UITableViewCell,
                                    NibLoadable,
                                    ReusableCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!

    private let datePicker = UIDatePicker()
    private let toolbar = UIToolbar(frame: .init(x: 0.0, y: 0.0, width: 100.0, height: 100.0))

    weak var delegate: DateInputCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none

        commonInit()
    }

    private func commonInit() {
        selectionStyle = .none

        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
        datePicker.datePickerMode = .date

        textField.textAlignment = .right
        textField.inputView = datePicker

        configureToolbar()
    }

    private func configureToolbar() {
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDoneButton))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([spaceButton, doneButton], animated: false)
        toolbar.sizeToFit()
        textField.inputAccessoryView = toolbar
    }

    @objc private func didTapDoneButton() {
        delegate?.cell(self, didChangeValue: datePicker.date)
        endEditing(true)
    }
}

// MARK: - Configure
extension DateInputTableViewCell {

    func configure(_ viewModel: DateInputViewModel) {
        titleLabel.text = viewModel.title

        textField.placeholder = viewModel.title
        textField.text = viewModel.valueString
    }
}
