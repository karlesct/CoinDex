//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

protocol CountryPickerViewModelProtocol: AnyObject {
    var dictionary: [String: [CountryPickerCellModel]] { get set }
    var sectionTitles: [String] { get set }
    var view: CountryPickerViewProtocol? { get set }
    func viewDidLoad()
    func searchTextDidChange(text: String)
}

protocol CountryPickerViewProtocol: AnyObject {
    func reloadData()
}

final class CountryPickerViewModel: CountryPickerViewModelProtocol {

    // MARK: - Properties
    
    var dataSource: [CountryPickerCellModel] = []

    var dictionary: [String: [CountryPickerCellModel]] = [String: [CountryPickerCellModel]]()
    var dictionaryAll: [String: [CountryPickerCellModel]] = [String: [CountryPickerCellModel]]()
    var sectionTitles: [String] = []

    var view: CountryPickerViewProtocol?

    var respository: CountryPickerRepositoryProtocol

    // MARK: - Init

    init (repository: CountryPickerRepositoryProtocol) {
        self.respository = repository
    }

    // MARK: - Methods

    func viewDidLoad() {
        let countries = self.respository.getCountries()
        countries.forEach { item in
            let item = CountryPickerCellModel(item: item)
            self.dataSource.append(item)
        }
        self.dictionaryAll = Dictionary(grouping: self.dataSource,
                                     by: {String($0.countryName.prefix(1))})
        self.dictionary = self.dictionaryAll
        self.sectionTitles = dictionary.keys.sorted()
    }

    func searchTextDidChange(text: String) {
        if text.isEmpty {
            self.dictionary = self.dictionaryAll
        } else if text.count > 2 {
            self.dictionary = self.dictionaryAll.mapValues{
                $0.filter{ $0.value.contains(text)}
            }
        }
        self.sectionTitles = dictionary.filter {
            !$0.value.isEmpty
        }.keys.sorted()
        self.view?.reloadData()
    }
}
