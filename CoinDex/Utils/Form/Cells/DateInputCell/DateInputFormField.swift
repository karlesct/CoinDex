//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class DateInputFormField {

    let key: String
    var viewModel: DateInputCellModel

    weak var delegate: FormFieldDelegate?

    init(key: String, viewModel: DateInputCellModel) {
        self.key = key
        self.viewModel = viewModel
    }
}

// MARK: - FormField
extension DateInputFormField: FormField {

    func register(for tableView: UITableView) {
        tableView.register(DateInputTableViewCell.self)
    }

    func dequeue(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(DateInputTableViewCell.self,
                                                 for: indexPath)
        cell.configure(with: viewModel)
        cell.delegate = self
        return cell
    }
}

// MARK: - FieldDataSource
extension DateInputFormField: FieldDataSource {

    var value: Date? {
        get {
            viewModel.value
        }
        set {
            viewModel.value = newValue
        }
    }
}

// MARK: - ToggleInputCellDelegate
extension DateInputFormField: DateInputCellDelegate {

    func cell(_ cell: DateInputTableViewCell, didChangeValue value: Date) {
        viewModel.value = value
        cell.configure(with: viewModel)
    }
}
