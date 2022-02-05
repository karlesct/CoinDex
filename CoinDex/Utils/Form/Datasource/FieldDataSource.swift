//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

protocol FieldDataSource: AnyObject {

    associatedtype Value
    associatedtype ViewModel

    var viewModel: ViewModel { get set }
    var value: Value { get set }
}
