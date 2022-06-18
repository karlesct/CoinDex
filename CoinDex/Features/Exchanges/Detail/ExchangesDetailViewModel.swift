//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

protocol ExchangesDetailViewModelProtocol: TitleProtocol,
                                           DatasourceProtocol,
                                           WillAppearProtocol{
    var view: ExchangesDetailViewProtocol? { get set }
    func doRequest()
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
    private var repository: ExchangesDetailRepositoryProtocol
    private let logging: LoggingServiceProtocol
    
    weak var view: ExchangesDetailViewProtocol?

    // MARK: - Init
    
    init(id: String,
         repository: ExchangesDetailRepositoryProtocol,
         logging: LoggingServiceProtocol) {
        self.id = id
        self.repository = repository
        self.logging = logging
    }

    // MARK: - Methods
    
    func willAppear() {
        self.doRequest()
    }
    
    func doRequest() {
        self.view?.setLoading(isLoading: true)
        self.dataSource = []
        self.repository.fetchList(id: self.id) { [weak self] result in
            self?.view?.setLoading(isLoading: false)
            switch result {
            case let .success(item):
                self?.dataSource? = item
            case let .failure(error):
                self?.dataSource = []
                self?.logging.log(error)
            }
        }
    }

}
