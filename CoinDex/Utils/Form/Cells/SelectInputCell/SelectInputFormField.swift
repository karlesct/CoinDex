//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class SelectInputFormField<Value: SelectableItem> {

    let key: String
    var viewModel: SelectInputCellModel
    var dataSource: [Value]

    weak var cell: SelectInputTableViewCell?
    weak var delegate: FormFieldDelegate?
    weak var router: OpenSelectRouterInput?

    private var selectedIndex: Int?

    init(key: String, viewModel: SelectInputCellModel, dataSource: [Value] = [], router: OpenSelectRouterInput?) {
        self.key = key
        self.viewModel = viewModel
        self.dataSource = dataSource
        self.router = router
    }
}

// MARK: - FormField
extension SelectInputFormField: FormField {

    func register(for tableView: UITableView) {
        tableView.register(SelectInputTableViewCell.self)
    }

    func dequeue(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(SelectInputTableViewCell.self,
                                                 for: indexPath)
        cell.configure(with: viewModel)
        self.cell = cell
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if dataSource.isEmpty { return }
        router?.showSelectScreen(output: self)
    }
}

// MARK: - FieldDataSource
extension SelectInputFormField: FieldDataSource {

    var value: Value? {
        get {
            guard let selectedIndex = selectedIndex else { return nil }
            return dataSource[selectedIndex]
        }
        set {
            if let value = newValue {
                let index = dataSource.firstIndex(of: value)
                selectedIndex = index
                viewModel.value = value.title
            } else {
                selectedIndex = nil
                viewModel.value = nil
            }
            delegate?.fieldDidChangeValue(self)
        }
    }
}

// MARK: - InputDataSource
extension SelectInputFormField: InputDataSource {}

// MARK: - SelectModuleOutput
extension SelectInputFormField: SelectModuleOutput {

    var title: String {
        "Select Item"
    }

    var list: [String] {
        dataSource.map { $0.title }
    }

    func didSelectItem(at index: Int) {
        value = dataSource[index]
        cell?.configure(with: viewModel)
    }
}
