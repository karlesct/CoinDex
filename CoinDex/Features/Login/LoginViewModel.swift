//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

protocol LoginViewProtocol: FormViewInput {
    var dataSource: FormDataSource { get }
    func configure()
}

protocol LoginViewModelProtocol: AnyObject {
    var view: LoginViewProtocol? { get set }
    func viewDidLoad()
}


final class LoginViewModel: LoginViewModelProtocol {

    // MARK: - Properties

    var respository: LoginRepositoryProtocol

    weak var view: LoginViewProtocol?

    // MARK: - Init

    init (repository: LoginRepositoryProtocol) {
        self.respository = repository
    }

    // MARK: - Methods

    func viewDidLoad() {
        let sections: [FormSection] = [
            .init(
                key: "login",
                fields: [
                    TitleFormField(key: "Title",
                                   viewModel: .init(title: "Bienvenido a ...")),
                    TextInputFormField(key: "Identificador",
                                       viewModel: .init(title: "Introduce tu identificador", placeholder: "Ej. 123456789")),
                ]
            )
        ]
        self.view?.dataSource.updateSections(sections)
        self.view?.dataSource.fields.forEach {
            $0.delegate = self
        }
    }
}

extension LoginViewModel: FormFieldDelegate {

    func fieldDidChangeValue(_ field: FormField) {
        switch field.key {
        default: break
        }
    }
}
