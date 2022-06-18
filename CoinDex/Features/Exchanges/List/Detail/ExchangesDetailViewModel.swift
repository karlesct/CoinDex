//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

protocol ExchangesDetailViewModelProtocol: TitleProtocol,
                                           DatasourceProtocol,
                                           WillAppearProtocol{
    var view: ExchangesDetailViewProtocol? { get set }
}

protocol ExchangesDetailViewProtocol: AnyObject {
    func setLoading(isLoading: Bool)
    func needsReaload()
}

class ExchangesDetailViewModel: ExchangesDetailViewModelProtocol {

    // MARK: - Properties
    
    var title: String = "exchange_detail_title".localized
    
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
    
    func willAppear() {
        self.doRequest()
    }
    
    private func doRequest() {
        self.view?.setLoading(isLoading: true)
        self.repository.fetchList(id: self.id) { [weak self] result in
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
