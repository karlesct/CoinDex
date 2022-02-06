//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class ToggleInputFormField {

    let key: String
    var viewModel: ToggleInputCellModel

    weak var delegate: FormFieldDelegate?

    init(key: String, viewModel: ToggleInputCellModel) {
        self.key = key
        self.viewModel = viewModel
    }
}

// MARK: - FormField
extension ToggleInputFormField: FormField {

    func register(for tableView: UITableView) {
        tableView.register(ToggleInputTableViewCell.self)
    }

    func dequeue(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ToggleInputTableViewCell.self,
                                                 for: indexPath)
        cell.configure(with: viewModel)
        cell.delegate = self
        return cell
    }
}

// MARK: - FieldDataSource
extension ToggleInputFormField: FieldDataSource {

    var value: Bool {
        get {
            viewModel.value
        }
        set {
            viewModel.value = newValue
        }
    }
}

// MARK: - ToggleInputCellDelegate
extension ToggleInputFormField: ToggleInputCellDelegate {

    func cell(_ cell: ToggleInputTableViewCell, didChangeValue value: Bool) {
        viewModel.value = value
        delegate?.fieldDidChangeValue(self)
    }
}
