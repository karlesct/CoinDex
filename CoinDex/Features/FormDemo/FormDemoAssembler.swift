//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

final class FormDemoModule {

    let view: FormDemoViewController
    let viewModel: FormDemoViewModel
    let router: FormDemoRouter

    init() {
        view = FormDemoViewController()
        router = FormDemoRouter()
        viewModel = FormDemoViewModel(router: router)

        view.output = viewModel
        viewModel.view = view
        router.view = view
    }
}
