//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

final class SelectViewModel {

    weak var view: SelectViewInput?
    weak var output: SelectModuleOutput?

    private(set) var list: [String] = []
}

// MARK: - SelectViewOutput
extension SelectViewModel: SelectViewOutput {

    func viewDidLoad() {
        view?.configure()
        view?.setTitle(output?.title)
        list = output?.list ?? []
        view?.reloadTableView()
    }

    func didSelectItem(at index: Int) {
        output?.didSelectItem(at: index)
    }
}
