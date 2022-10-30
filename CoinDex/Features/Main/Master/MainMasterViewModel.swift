//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation
import Combine

protocol MainMasterViewModelProtocol: TitleProtocol,
                                      LoadingProtocol {
}

class MainMasterViewModel: MainMasterViewModelProtocol {

    // MARK: - Properties
    
    var title: String = "exchange_list_master_title".localized
    
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

