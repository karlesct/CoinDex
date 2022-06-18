//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

protocol ExchangesListMasterViewModelProtocol: TitleProtocol,
                                               DatasourceProtocol,
                                               WillAppearProtocol {
    var page: Int { get set }
    var view: ExchangesListMasterViewProtocol? { get set }
}

protocol ExchangesListMasterViewProtocol: AnyObject {
    func setLoading(isLoading: Bool)
    func needsReaload()
}

class ExchangesListMasterViewModel: ExchangesListMasterViewModelProtocol {

    // MARK: - Properties
    
    var title: String = "exchange_list_master_title".localized
    
    var dataSource: [TModel]? = [] {
        didSet {
            self.view?.needsReaload()
        }
    }
    
    var page: Int = 0 {
        didSet {
            self.doRequest(page: self.page)
        }
    }
    
    var repository: ExchangesListMasterRepositoryProtocol
    
    weak var view: ExchangesListMasterViewProtocol?

    // MARK: - Init
    
    init(repository: ExchangesListMasterRepositoryProtocol) {
        self.repository = repository
    }

    // MARK: - Methods
    
    func willAppear() {
        self.doRequest(page: self.page)
    }
    
    private func doRequest(page: Int) {
        self.view?.setLoading(isLoading: true)
        self.repository.fetchList(page: page) { [weak self] result in
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
