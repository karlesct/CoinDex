//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

protocol CountryPickerRepositoryProtocol {
    func getCountries() -> [CountryModel]
}

final class CountryPickerRepository {

    // MARK: - Properties

    // MARK: - Init

    init() {}

}
extension CountryPickerRepository: CountryPickerRepositoryProtocol {

    func getCountries() -> [CountryModel] {
        guard let path = Bundle.main.path(forResource: "isoCountryCode",
                                          ofType: "json"),
              let data = try? Data(contentsOf: URL(fileURLWithPath: path))
        else { return [] }
        return (try? JSONDecoder().decode([CountryModel].self,
                                          from: data)) ?? []
    }
}
