//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

protocol FuelMapViewProtocol {
    func setLoading(loading: Bool)
}

protocol FuelMapViewModelProtocol {
    var view: FuelMapViewProtocol? { get set }
    func viewWillAppear()
}

class FuelMapViewModel: FuelMapViewModelProtocol {

    // MARK: - Properties

    var view: FuelMapViewProtocol?
    
    // MARK: - Init

    init() {
    }

    // MARK: - Methods

    func viewWillAppear() {
    }
}

