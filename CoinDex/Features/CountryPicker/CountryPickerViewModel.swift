//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

protocol CountryPickerViewModelProtocol {
    var dataSource: [TModel]? { get set }
    var view: CountryPickerViewProtocol? { get set }
    func viewDidLoad()
    func searchTextDidChange(text: String)
}

protocol CountryPickerViewProtocol {
    func reloadData()
}

class CountryPickerViewModel: CountryPickerViewModelProtocol {

    // MARK: - Properties
    var dataSourceAll: [TModel]? = []
    var dataSource: [TModel]? = []
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
            self.dataSource?.append(item)
            self.dataSourceAll?.append(item)
        }
    }

    func searchTextDidChange(text: String) {
        if let dataSource = self.dataSourceAll as? [CountryPickerCellModel] {
            self.dataSource =  dataSource.filter({
                $0.value.contains(text)
            })
            self.view?.reloadData()
        }
    }
}
