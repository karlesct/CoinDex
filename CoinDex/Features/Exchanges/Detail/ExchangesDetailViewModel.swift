//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation
import Combine

protocol ExchangesDetailViewModelProtocol: TitleProtocol,
                                           DatasourceProtocol,
                                           LoadingProtocol {
    func doRequest()
}

class ExchangesDetailViewModel: ExchangesDetailViewModelProtocol {

    // MARK: - Properties
    
    var title: String = "exchange_detail_title".localized
    
    @Published private(set) var dataSource: [TModel]? = []
    var dataSourcePublished: Published<[TModel]?> { _dataSource }
    var dataSourcePublisher: Published<[TModel]?>.Publisher { $dataSource }
    
    @Published private(set) var isLoading: Bool = false
    var isLoadingPublished: Published<Bool> { _isLoading }
    var isLoadingPublisher: Published<Bool>.Publisher { $isLoading }
    
    private let id: String
    private var repository: ExchangesDetailRepositoryProtocol
    private let logging: LoggingServiceProtocol

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
        self.isLoading = true
        self.dataSource = []
        self.repository.fetchList(id: self.id) { [weak self] result in
            self?.isLoading = false
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
