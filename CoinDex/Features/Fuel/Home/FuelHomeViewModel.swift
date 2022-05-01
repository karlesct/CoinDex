//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

protocol FuelHomeViewProtocol {
    func setLoading(loading: Bool)
}

protocol FuelHomeViewModelProtocol {
    var view: FuelHomeViewProtocol? { get set }
    var dataSource: [ListaEESSPrecio]? { get set }
    func viewWillAppear()
}

class FuelHomeViewModel: FuelHomeViewModelProtocol {

    // MARK: - Properties

    let repository: DefaultRepositoryProtocol

    var view: FuelHomeViewProtocol?
    var dataSource: [ListaEESSPrecio]?
    
    // MARK: - Init

    init(repository: DefaultRepositoryProtocol) {
        self.repository = repository
    }

    // MARK: - Methods

    func viewWillAppear() {
        let request = FuelHomeAPIRequest()
        view?.setLoading(loading: true)
        self.repository.fetch(request: request) { [weak self] result in
            self?.view?.setLoading(loading: false)
            switch result {
            case .success(let model):
                NSLog("[FuelHomeViewModel] - Response succcess: \(model)")
                self?.dataSource = model.listaEESSPrecio
            case .failure(let error):
                NSLog("[FuelHomeViewModel] - Response failure: \(error)")
            }
        }
    }
}
