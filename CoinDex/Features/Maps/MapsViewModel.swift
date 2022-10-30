//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

protocol MapsViewModelProtocol: TitleProtocol,
                                DatasourceProtocol,
                                LoadingProtocol {
}

class MapsViewModel: MapsViewModelProtocol {

    // MARK: - Properties
    
    var title: String = "exchange_list_master_title".localized
    
    @Published private(set) var dataSource: [TModel]? = []
    var dataSourcePublished: Published<[TModel]?> { _dataSource }
    var dataSourcePublisher: Published<[TModel]?>.Publisher { $dataSource }
    
    @Published private(set) var isLoading: Bool = false
    var isLoadingPublished: Published<Bool> { _isLoading }
    var isLoadingPublisher: Published<Bool>.Publisher { $isLoading }
    
    var logging: LoggingServiceProtocol

    // MARK: - Init
    
    init(logging: LoggingServiceProtocol) {
        self.logging = logging
    }

    // MARK: - Methods
    

}
