//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation
import Combine

protocol BreakingBadDetailViewModelProtocol: TitleProtocol {
    
    var charId: Int? { get }
    var urlPublisher: Published<String>.Publisher { get }
    var namePublisher: Published<String>.Publisher { get }
    var nicknamePublisher: Published<String>.Publisher { get }
    var categoryPublisher: Published<String>.Publisher { get }
    var isFavoritePublisher: Published<Bool>.Publisher { get }
    
    func fillData()
}

class BreakingBadDetailViewModel: BreakingBadDetailViewModelProtocol {

    // MARK: - Properties
    
    var title: String = "breaking_bad_detail_title".localized
    var charId: Int?
    
    @Published private(set) var url: String = .empty
    var urlPublished: Published<String> { _url }
    var urlPublisher: Published<String>.Publisher { $url }
    
    @Published private(set) var name: String = .empty
    var namePublished: Published<String> { _name }
    var namePublisher: Published<String>.Publisher { $name }
    
    @Published private(set) var nickname: String = .empty
    var nicknamePublished: Published<String> { _nickname }
    var nicknamePublisher: Published<String>.Publisher { $nickname }
    
    @Published private(set) var category: String = .empty
    var categoryPublished: Published<String> { _category }
    var categoryPublisher: Published<String>.Publisher { $category }
    
    @Published private(set) var isFavorite: Bool = false
    var isFavoritePublished: Published<Bool> { _isFavorite }
    var isFavoritePublisher: Published<Bool>.Publisher { $isFavorite }
    
    private var item: FavoritableCharactersItemResponse

    // MARK: - Init
    
    init(item: FavoritableCharactersItemResponse) {
        self.item = item
        self.charId = item.data.charId
    }

    // MARK: - Methods
    
    func fillData() {
        self.url = self.item.data.img
        self.name = self.item.data.name
        self.nickname = self.item.data.nickname
        self.category = self.item.data.category.rawValue
        self.isFavorite = self.item.favorite
    }
    
}
