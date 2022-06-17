//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

protocol ExchangesDetailViewModelProtocol {
    var dataSource: [TModel]? { get set }
    var view: ExchangesDetailViewProtocol? { get set }
    func viewWillAppear()
}

protocol ExchangesDetailViewProtocol: AnyObject {
    func setLoading(isLoading: Bool)
    func needsReaload()
}

class ExchangesDetailViewModel: ExchangesDetailViewModelProtocol {

    // MARK: - Properties
    
    var dataSource: [TModel]? = [] {
        didSet {
            self.view?.needsReaload()
        }
    }
    
    private let id: String
    var repository: ExchangesDetailRepositoryProtocol
    
    weak var view: ExchangesDetailViewProtocol?

    // MARK: - Init
    
    init(id: String,
         repository: ExchangesDetailRepositoryProtocol) {
        self.id = id
        self.repository = repository
    }

    // MARK: - Methods
    
    func viewWillAppear() {
        self.doRequest()
    }
    
    private func doRequest() {
        self.view?.setLoading(isLoading: true)
        self.repository.fetchList(page: 0) { [weak self] result in
            switch result {
            case let .success(item):
                self?.dataSource?.append(contentsOf: item)
//                self?.view?.needsReaload()
            case let .failure(error):
                break
            }
        }
    }

}
