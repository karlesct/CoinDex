//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

protocol SelectModuleOutput: AnyObject {

    var title: String { get }
    var list: [String] { get }

    func didSelectItem(at index: Int)
}

final class SelectModule {

    let view: SelectViewController
    let viewModel: SelectViewModel

    var output: SelectModuleOutput? {
        get { viewModel.output }
        set { viewModel.output = newValue }
    }

    init() {
        view = SelectViewController()
        viewModel = SelectViewModel()

        view.output = viewModel
        viewModel.view = view
    }
}
