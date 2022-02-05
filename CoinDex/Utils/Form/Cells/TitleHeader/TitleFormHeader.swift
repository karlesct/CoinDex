//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class TitleFormHeader {

    let key: String
    let viewModel: TitleHeaderFooterViewModel

    init(key: String, viewModel: TitleHeaderFooterViewModel) {
        self.key = key
        self.viewModel = viewModel
    }
}

extension TitleFormHeader: FormHeader {

    var height: CGFloat { 60.0 }

    func register(for tableView: UITableView) {
        tableView.register(TitleHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "TitleHeaderFooterView")
    }

    func dequeue(for tableView: UITableView, in section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: "TitleHeaderFooterView"
        ) as? TitleHeaderFooterView
        view?.configure(with: viewModel)
        return view
    }
}
