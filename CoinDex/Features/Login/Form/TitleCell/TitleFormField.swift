//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class TitleFormField {

    let key: String
    var viewModel: TitleCellModel

    weak var delegate: FormFieldDelegate?

    init(key: String,
         viewModel: TitleCellModel) {
        self.key = key
        self.viewModel = viewModel
    }
}

// MARK: - FormField
extension TitleFormField: FormField {

    func register(for tableView: UITableView) {
        tableView.register(TitleTableViewCell.self)
    }

    func dequeue(for tableView: UITableView,
                 at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(TitleTableViewCell.self,
                                                 for: indexPath)
        cell.configure(with: viewModel)
        return cell
    }
}
