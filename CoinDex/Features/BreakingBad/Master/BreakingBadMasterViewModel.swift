//
//  Copyright © 2022 CCT. All rights reserved.
//

import Foundation
import Combine

protocol BreakingBadMasterViewModelProtocol: TitleProtocol,
                                             LoadingProtocol {
    
    var dataSource: FavoritableCharactersResponse? { get }
    var dataSourcePublisher: Published<FavoritableCharactersResponse?>.Publisher { get }
    
    var page: Int { get set }
    func doRequest(page: Int)
    func setFavorite(charId: Int, didChangeValue value: Bool)
}

class BreakingBadMasterViewModel: BreakingBadMasterViewModelProtocol {

    // MARK: - Properties
    
    var title: String = "breaking_bad_master_title".localized
    
    @Published private(set) var dataSource: FavoritableCharactersResponse? = []
    var dataSourcePublished: Published<FavoritableCharactersResponse?> { _dataSource }
    var dataSourcePublisher: Published<FavoritableCharactersResponse?>.Publisher { $dataSource }
    
    @Published private(set) var isLoading: Bool = false
    var isLoadingPublished: Published<Bool> { _isLoading }
    var isLoadingPublisher: Published<Bool>.Publisher { $isLoading }
    
    var page: Int = 0 {
        didSet {
            self.doRequest(page: self.page)
        }
    }
    
    // MARK: - Properties Injected
    
    var repository: BreakingBadMasterRepositoryProtocol
    var logging: LoggingServiceProtocol

    // MARK: - Init
    
    init(repository: BreakingBadMasterRepositoryProtocol,
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
    
    func setFavorite(charId: Int, didChangeValue value: Bool) {
        guard let index = self.dataSource?.firstIndex(where: {
            $0.data.charId == charId
        }) else {
            return
        }
        self.dataSource?[index].favorite = value
    }
}
