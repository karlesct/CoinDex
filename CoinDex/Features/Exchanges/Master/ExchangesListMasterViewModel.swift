//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation
import Combine

protocol ExchangesListMasterViewModelProtocol: TitleProtocol,
                                               DatasourceProtocol,
                                               LoadingProtocol {
    var page: Int { get set }
    func doRequest(page: Int)
}

class ExchangesListMasterViewModel: ExchangesListMasterViewModelProtocol {

    // MARK: - Properties
    
    var title: String = "exchange_list_master_title".localized
    
    @Published private(set) var dataSource: [TModel]? = []
    var dataSourcePublished: Published<[TModel]?> { _dataSource }
    var dataSourcePublisher: Published<[TModel]?>.Publisher { $dataSource }
    
    @Published private(set) var isLoading: Bool = false
    var isLoadingPublished: Published<Bool> { _isLoading }
    var isLoadingPublisher: Published<Bool>.Publisher { $isLoading }
    
    var page: Int = 0 {
        didSet {
            self.doRequest(page: self.page)
        }
    }
    
    var repository: ExchangesListMasterRepositoryProtocol
    var logging: LoggingServiceProtocol

    // MARK: - Init
    
    init(repository: ExchangesListMasterRepositoryProtocol,
         logging: LoggingServiceProtocol) {
        self.repository = repository
        self.logging = logging
    }

    // MARK: - Methods
    
    func doRequest(page: Int) {
        self.isLoading = true
        self.repository.fetchList(page: page) { [weak self] result in
            self?.isLoading = false
            switch result {
            case let .success(item):
                self?.dataSource?.append(contentsOf: item)
            case let .failure(error):
                self?.logging.log(error)
            }
        }
    }

}
