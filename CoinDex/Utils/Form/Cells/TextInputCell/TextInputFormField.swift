//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class TextInputFormField {

    let key: String
    var viewModel: TextInputViewModel

    weak var delegate: FormFieldDelegate?

    init(key: String, viewModel: TextInputViewModel) {
        self.key = key
        self.viewModel = viewModel
    }
}

// MARK: - FormField
extension TextInputFormField: FormField {

    var height: CGFloat { 44.0 }

    func register(for tableView: UITableView) {
        tableView.register(TextInputTableViewCell.self)
    }

    func dequeue(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(TextInputTableViewCell.self,
                                                 for: indexPath)

        cell.delegate = self
        cell.configure(viewModel)
        return cell
    }
}

// MARK: - FieldDataSource
extension TextInputFormField: FieldDataSource {

    var value: String {
        get {
            viewModel.value ?? ""
        }
        set {
            viewModel.value = newValue
        }
    }
}

// MARK: - TextInputCellDelegate
extension TextInputFormField: TextInputCellDelegate {

    func cell(_ cell: TextInputTableViewCell, didChangeValue value: String?) {
        viewModel.value = value
    }
}
