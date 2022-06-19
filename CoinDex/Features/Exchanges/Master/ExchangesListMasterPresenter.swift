//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

protocol ExchangesListMasterPresenterProtocol: TitleProtocol,
                                               DatasourceProtocol,
                                               WillAppearProtocol {
    var page: Int { get set }
    var view: ExchangesListMasterViewProtocol? { get set }
}

protocol ExchangesListMasterViewProtocol: AnyObject {
    func setLoading(isLoading: Bool)
    func needsReaload()
}

class ExchangesListMasterPresenter: ExchangesListMasterPresenterProtocol {

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
    var logging: LoggingServiceProtocol
    
    weak var view: ExchangesListMasterViewProtocol?

    // MARK: - Init
    
    init(repository: ExchangesListMasterRepositoryProtocol,
         logging: LoggingServiceProtocol) {
        self.repository = repository
        self.logging = logging
    }

    // MARK: - Methods
    
    func willAppear() {
        self.doRequest(page: self.page)
    }
    
    private func doRequest(page: Int) {
        self.view?.setLoading(isLoading: true)
        self.repository.fetchList(page: page) { [weak self] result in
            self?.view?.setLoading(isLoading: false)
            switch result {
            case let .success(item):
                self?.dataSource?.append(contentsOf: item)
            case let .failure(error):
                self?.logging.log(error)
            }
        }
    }

}
