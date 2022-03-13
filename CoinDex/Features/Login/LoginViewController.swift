//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

final class LoginViewController: FormViewController {

    // MARK: - IBoutlets

    // MARK: - Properties

    var viewModel: LoginViewModelProtocol?

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewModel?.view = self
        
        self.viewModel?.viewDidLoad()
    }
}

extension LoginViewController: LoginViewProtocol {

    func configure() {
        
    }
}
